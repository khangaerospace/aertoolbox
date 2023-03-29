function [tt,uu] = crank_nicolson(odefun,T,dt,u0)
    tt = 0:dt:T;
    uu  = zeros(size(tt));
    uu(1) = u0;
    for i = 2:length(uu)
        u = uu(i-1);
        [fpre,dfdypre] = odefun(tt(i-1),uu(i-1));
        [f,dfdu] = odefun(tt(i),u);
        x = u - uu(i-1) - (dt/2)*(f+fpre);
        df = 1 - (dt/2)*dfdypre;
        % Use newton method.
        while abs(x) > 1e-13
            u = u - x/df;
            [fpre,dfdypre] = odefun(tt(i-1),uu(i-1));
            [f,dfdu] = odefun(tt(i),u);
            x = u - uu(i-1) - (dt/2)*(f+fpre);
            df = 1 - (dt/2)*dfdypre;
        end
        uu(i) = u;
    end
end