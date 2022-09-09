import numpy as np
H = np.array([   ## matrix Hessenberg inferior
    [1, 2, 0, 0, 0],
    [5, 2, 3, 0, 0],
    [3, 4, 3, 7, 0],
    [5, 6, 1, 1, 1]
])

A = np.array([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [10, 11, 12],
    [13, 14, 15]
])

print(np.matmul(H, A))

M = np.zeros([H.shape[0], A.shape[1]])
# print(M)


for i in range(H.shape[0]):
    for j in range(A.shape[1]):
        for k in range(H.shape[1]):
            if k-i > 1:
                break
            # print(k, i)
            M[i, j] = M[i, j] + H[i, k] * A[k, j]

print(M)