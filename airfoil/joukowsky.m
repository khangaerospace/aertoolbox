% Copyright (c) 2023 Masayuki Yano, University of Toronto
classdef joukowsky
    properties
        Vinftil = 1.0;
        alpha = 5*pi/180;
        %mu = -0.1+0.05*1i; 
        mu = -0.1; % no camber to make the leading edge map to (0,0)
        tea = 2*pi/180;
        n
        R
        th0
        cdim
        z0dim
        smax
    end
    methods
        function obj = joukowsky      
            obj.n = 2-obj.tea/pi;
            obj.R = abs(1-obj.mu);
            obj.th0 = asin(imag(obj.mu)/obj.R);
            zeta = [-1+2*real(obj.mu); 1];
            z = zeta2z(obj,zeta,false);
            obj.cdim = z(2)-z(1);
            obj.z0dim = z(1);
        end
        function cp = th2cp(obj,th)
            obj.R = abs(1-obj.mu);
            zeta = obj.th2zeta(th);
            Gamma = 4*pi*obj.Vinftil*obj.R*sin(obj.alpha+asin(imag(obj.mu)/obj.R));
            wtil = obj.Vinftil*exp(-1i*obj.alpha)*ones(size(zeta)) ...
                - obj.Vinftil.*obj.R^2.*exp(1i*obj.alpha)./(zeta-obj.mu).^2 ...
                + 1i*Gamma./(2*pi*(zeta-obj.mu));
            [~,dzdzeta] = obj.zeta2z(zeta);
            w = wtil./dzdzeta;
            Vinf = obj.Vinftil*obj.cdim;
            cp = 1 - (abs(w./Vinf)).^2;
        end
        function [zeta,dzetadth] = th2zeta(obj,th)
            obj.R = abs(1-obj.mu);
            zeta = obj.R*exp(1i*(th-obj.th0)) + obj.mu;
            if (nargout > 1)
                dzetadth = 1i*obj.R*exp(1i*(th-obj.th0));
            end
        end
        function [z,dzdzeta] = zeta2z(obj,zeta,nondimflag)
            if (nargin < 3)
                nondimflag = true;
            end
            A = 1+1./zeta;
            B = 1-1./zeta;
            z = obj.n*(A.^obj.n+B.^obj.n)./(A.^obj.n-B.^obj.n);
            if (nondimflag)
                z = (z - obj.z0dim)./obj.cdim;
            end
            if (nargout > 1)
                dzdzeta = 4.*obj.n^2./(zeta.^2-1).*(A.^obj.n.*B.^obj.n)./(A.^obj.n-B.^obj.n).^2;
                if (nondimflag)
                    dzdzeta = dzdzeta./obj.cdim;
                end
            end
        end
        function y = geometry(obj,x)
           y = imag(obj.zeta2z(obj.th2zeta(obj.x2th(x,true))));
        end
        function th = x2th(obj,x0,upper)
            x0 = (1-2e-13)*x0 + 1e-13;
            if (upper)
                th = interp1([1,0],[0,pi-1e-2],x0);
            else
                th = interp1([0,1],[pi+1e-2,2*pi],x0);
            end
            r = 1;
            while (max(abs(r)) > 1e-11)
                [zeta,dzetadth] = obj.th2zeta(th);
                [z,dzdzeta] = obj.zeta2z(zeta,true);
                r = x0 - real(z);
                dxdth = real(dzdzeta.*dzetadth);
                dth = dxdth.\r;
                th = th + dth;
            end
        end
        function outputdata(obj)
            x = linspace(0,1,33)';
            x = 0.5 - 0.5*cos(pi*x);
            for side = [0,1]
                th = obj.x2th(x,side);
                y(:,side+1) = imag(obj.zeta2z(obj.th2zeta(th)));
                cp(:,side+1) = obj.th2cp(th);
            end
            dat = [x,y(:,2),cp];
            fprintf('%10.6f %10.6f %10.6f %10.6f\n', dat');
            figure(1), clf,
            plot(x,y); axis equal;
            figure(2), clf,
            plot(x,cp);
        end
        function plotcp(obj)
            x = linspace(0,1,1001)';
            figure(1), clf,
            for side = [0,1]
                th = obj.x2th(x,side);
                cp = obj.th2cp(th);
                plot(x,cp); hold on
            end           
        end
        function plotgeom(obj)
            x = linspace(0,1,1001)';
            figure(1), clf,
            for side = [0,1]
                th = obj.x2th(x,side);
                z = obj.zeta2z(obj.th2zeta(th));
                plot(x,imag(z)); hold on
            end
        end
        function plotgeom2(obj)
            figure(1), clf,
            th = pi + linspace(-0.1,0.1,101)';
            z = obj.zeta2z(obj.th2zeta(th));
            plot(real(z),imag(z));
            [xmin,ind] = min(real(z));
        end
    end
    methods (Static)
        function [x,w] = getquad(N)
            alpha = 0;
            beta = 0;
            if (N==0) 
                x(1)=(alpha-beta)/(alpha+beta+2); 
                w(1) = 2; 
                return; 
            end;
            
            J = zeros(N+1);
            h1 = 2*(0:N)+alpha+beta;
            J = diag(-1/2*(alpha^2-beta^2)./(h1+2)./h1) + ...
                diag(2./(h1(1:N)+2).*sqrt((1:N).*((1:N)+alpha+beta).*...
                ((1:N)+alpha).*((1:N)+beta)./(h1(1:N)+1)./(h1(1:N)+3)),1);
            if (alpha+beta<10*eps) J(1,1)=0.0;end;
            J = J + J';
            
            [V,D] = eig(J); x = diag(D);
            w = (V(1,:)').^2*2^(alpha+beta+1)/(alpha+beta+1)*gamma(alpha+1)*...
                gamma(beta+1)/gamma(alpha+beta+1);
            
            x = 0.5*(x+1);
            w = 0.5*w;
        end
    end
end
