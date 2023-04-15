function [I] = intmidpoint (fun,a,b)
    % input fun: function we want to integrate
    % input a: start point
    % input b: end point
    % output I: Integral using the midpoint rule
    c = (a+b)/2;
    y = fun(c);
    I = (b-a)*y;
end