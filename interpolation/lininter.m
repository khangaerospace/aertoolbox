function [y] = lininter(d1,d2,x)
    % input d1: [x1, y1] data point 1
    % input d2: [x2, y2] data point 2
    % input x: point we want to find between the two x1 and x2
    % output y: value at x from linear interpolant.
    x1 = d1(1);
    x2 = d2(1);
    y1 = d1(2);
    y2 = d2(2);
    y = (1 - ((x-x1)/(x2-x1)))*y1 + ((x-x1)/(x2-x1))*y2;
end