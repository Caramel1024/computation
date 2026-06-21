function LUDecomposition(A)
    n = size(A, 1)
    L = zeros(n, n)
    U = copy(A)

    for k in 1:n
        L[k, k] = 1
        for i in (k+1):n
            if U[k, k] != 0
                L[i, k] = U[i, k] / U[k, k]
                U[i, :] -= L[i, k] * U[k, :]
            end
        end
    end

    return L, U
end