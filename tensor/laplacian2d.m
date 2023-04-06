function A = laplacian2d(n1)
    h = 1/(n1+1);
    A1 = 1/h^2*spdiags([ones(n1,1),-2*ones(n1,1),ones(n1,1)],[-1,0,1],n1,n1);
    E1 = speye(n1);
    A = kron(A1,E1) + kron(E1,A1);
end