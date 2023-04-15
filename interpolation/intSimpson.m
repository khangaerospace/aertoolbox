function [I] = intSimpson(fun,a,b)
    % input d1: [x1, y1] data point 1
    % input d2: [x2, y2] data point 2
    % input x: point we want to find between the two x1 and x2
    % output y: value at x from linear interpolant.
    c = (a+b)/2;
    I = (b-a)*((1/6)*fun(a) + (4/6)*fun(c) + (1/6)*fun(b));
end