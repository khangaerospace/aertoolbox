function [q,e,cnt] = adaptive_gauss_kronrod(f,a,b,tol)
    % this function will do the computation
    file = load("gauss_kronrod.dat");
    qpoint = file(:,1);
    g7 = file(:,2);
    k15 = file(:,3);
    % now we have all the point to the the integral
    x = a+((b-a)/2)*(qpoint+1); % the point
    weightg =  ((b-a)/2)*g7;
    weightk = ((b-a)/2)*k15;
    Qg = 0;
    Qk = 0;
    for i = 1:length(x)
        Qg = Qg + weightg(i)*f(x(i));
        Qk = Qk + weightk(i)*f(x(i));
    end
    Q = Qk;
    E = (200*abs(Qg - Qk))^(3/2);
    count =15;
    
    % return everything
    if (E < tol)
        q = Q;
        cnt = count;
        e = E;
    else
        c = (a+b)/2; % split in half
        [QL, EL, cntL] = adaptive_gauss_kronrod(f,a,c,tol/2);
        [QR, ER, cntR] = adaptive_gauss_kronrod(f,c,b,tol/2);
        q = QL + QR;
        e = EL + ER;
        cnt = count + cntL + cntR;
    end
end
