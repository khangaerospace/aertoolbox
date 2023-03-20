function [x,fmin,path] = newton_opt(fun,x0,tol)
    xi = x0;
    [f,df,ddf] = fun(xi);
    path = xi;
    count = [1:6];
    nor = zeros(0,6);
    i = 1;
    while norm(ddf\df) > tol
        [f,df,ddf] = fun(xi);
        xi = xi - (ddf\df);
        nor(i) = norm(ddf\df);
        path = [path,xi];
        fprintf('%d %.4e\n', i, norm(ddf\df));
        i = i+1;
    end
    plot(count,nor)
    x = xi;
    fmin = f;
    
end