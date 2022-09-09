import numpy as np
n = 3
B = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]

P = [[0, 1, 0],
    [0, 0, 1],
    [1, 0, 0]]

A = [["A", "B", "C"],
    ["D", "E", "F"],
    ["G", "H", "I"]]

# for i in range(n):
#     for j in range(n):
#         if P[i][j] != 0:
#             for k in range(n):
#                 B[i][k] = A[j][k]
#             break

# for i in range(len(B)):
#     print(B[i])

for j in range(n):
    for i in range(n):
        if P[i][j] != 0:
            for k in range(n):
                B[k][j] = A[k][i]
            break

for i in range(len(B)):
    print(B[i])

