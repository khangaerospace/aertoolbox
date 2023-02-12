% Copyright (c) 2023 Masayuki Yano, University of Toronto
function y = ktgeom(x)
if any(x < 0.0 | x > 1.0)
    error('x is out of range');
end
jou = joukowsky();
y = jou.geometry(x);
