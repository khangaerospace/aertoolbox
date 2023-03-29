function [tt,uu] = forward_euler(odefun,T,dt,u0)    
    tt = (0:dt:T);
    uu  = zeros(size(tt));
    uu(1) = u0;  % inital condition
    for i = 2:length(uu)
        uu(i) = uu(i-1) + dt*odefun(tt(i-1),uu(i-1)); 
    end
end