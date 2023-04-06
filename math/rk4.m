function [tt,uu] = rk4(odefun,T,dt,u0)
    tt = 0:dt:T;
    uu  = zeros(length(u0),length(tt));
    uu(:,1) = u0;
    
    for i = 2:length(tt)
        v1 = uu(:,i-1);
        F1 = odefun(tt(i-1),v1);
        v2 = uu(:,i-1)+(1/2)*dt*F1;
        F2 = odefun(tt(i-1)+(1/2)*dt,v2);
        v3 = uu(:,i-1)+(1/2)*dt*F2;
        F3 = odefun(tt(i-1)+(1/2)*dt,v3);
        v4 = uu(:,i-1)+dt*F3;
        F4 = odefun(tt(i-1)+dt,v4);
        u = uu(:,i-1) + dt*((1/6)*F1+(1/3)*F2+(1/3)*F3+(1/6)*F4);
        uu(:,i) = u;
    end
end