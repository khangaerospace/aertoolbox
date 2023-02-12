function q = composite_gauss2(f,a,b,n)
    x1 = -1/sqrt(3);
    x2 = 1/sqrt(3);
    w = 1;
    %range 
    x = linspace(a,b,n+1);
    weight = w*(x(2)-a)/2;
    Q = 0;
    % find new A and B.
    for i = 1:length(x)-1
        region1 = x(i) + ((x(i+1)-x(i))/2)*(x1+1);
        region2 = x(i) + ((x(i+1)-x(i))/2)*(x2+1);
        Q = Q + (weight*f(region1)+weight*f(region2));
    end
    q = Q;
    
end 