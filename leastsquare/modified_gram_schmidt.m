function [Q, R] = modified_gram_schmidt(A)
    % Computes the QR factorization of matrix A using the Modified Gram-Schmidt algorithm
    n = size(A, 2);
    Q_tilde = A;
    R = zeros(n);

    for j = 1:n
        R(j,j) = norm(Q_tilde(:,j));
        Q(:,j) = Q_tilde(:,j) / R(j,j);
        for k = j+1:n
            R(j,k) = Q(:,j)' * Q_tilde(:,k);
            Q_tilde(:,k) = Q_tilde(:,k) - R(j,k)*Q(:,j);
        end
    end

end
