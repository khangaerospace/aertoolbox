function x = linearsolver(A,b)
    [L,U] = lufac(A);
    z = forwardsub(L,b);
    x = backwardsub(U,z);
end