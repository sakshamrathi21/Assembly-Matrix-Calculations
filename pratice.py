import numpy as np

n = int(input())
s1 = int(input())
s2 = int(input())
s3 = int(input())
s4 = int(input())

M1 = np.zeros((n,n))
M2 = np.zeros((n,n))
M3 = np.zeros((n,n))
M4 = np.zeros((n,n))

for i in range(0, n):
    for j in range(0, n):
        temp = input()
        M1[i][j] = temp

for i in range(0, n):
    for j in range(0, n):
        temp = input()
        M2[i][j] = temp

for i in range(0, n):
    for j in range(0, n):
        temp = input()
        M3[i][j] = temp

for i in range(0, n):
    for j in range(0, n):
        temp = input()
        M4[i][j] = temp

B1 = s1*M1 + s2*M2
B2 = s3*M3 + s4*M4

F1 = np.multiply(B1, B2)

alternate_sum = int(np.sum([(-1) ** (i + j) * F1[i, j] for i in range(n) for j in range(n)]))

print("Alternate Sum of F1:", alternate_sum)