function [I] = intTrapezoi(fun,a,b)
    % input d1: [x1, y1] data point 1
    % input d2: [x2, y2] data point 2
    % input x: point we want to find between the two x1 and x2
    % output y: value at x from linear interpolant.
    I = (b-a)*(0.5*fun(a)+0.5*fun(b));
end