def f_and(x, a, b):
    for i in range(3):
        if ar[a][i] == 0 or ar[b][i] == 0:
            x[i] = 0
            continue
        if ar[a][i] == 1:
            x[i] = ar[b][i]
            continue
        if ar[b][i] == 1:
            x[i] = ar[a][i]
            continue
        if ar[a][i] == ar[b][i]:
            x[i] = ar[a][i]
            continue
        if ar[a][i]==2 or ar[b][i]==2:
            x[i] = 2
            continue
        if (ar[b][i] == 3 and ar[a][i] == 4) or (ar[a][i] == 4 and ar[b][i] == 3):
            x[i] = 2
            continue


def f_notand(x, a, b):
    f_and(x, a, b)
    for i in range(3):
        if x[i] == 0:
            x[i] = 1
            continue
        if x[i] == 1:
            x[i] = 0
            continue
        if x[i] == 3:
            x[i] = 4
            continue
        if x[i] == 4:
            x[i] = 3
            continue



def f_or(x, a, b):
    for i in range(3):
        if ar[a][i] == 1 or ar[b][i] == 1:
            x[i] = 1
            continue
        if ar[a][i] == ar[b][i]:
            x[i] = ar[a][i]
            continue
        if ar[a][i] == 2 or ar[b][i] == 2:
            x[i] = 2
            continue
        if ar[a][i] == 0:
            x[i] = ar[b][i]
            continue
        if ar[b][i] == 0:
            x[i] = ar[a][i]
            continue
        if (ar[b][i] == 3 and ar[a][i] == 4) or (ar[a][i] == 4 and ar[b][i] == 3):
            x[i] = 2
            continue


def make_op(x1, t):

    if operations[t][0] == "*":
        f_and(x1, operations[t][1], operations[t][2])

    if operations[t][0] == "not*":
        f_notand(x1, operations[t][1], operations[t][2])

    if operations[t][0] == "+":
        f_or(x1, operations[t][1], operations[t][2])



ar = [[0, 0, 0], #a
        [0, 0, 0],#b
        [0, 0, 0],#c
        [0, 0, 0],#d
        [0, 0, 0],#l
        [0, 0, 0],#m
        [0, 0, 0],#h
        [0, 0, 0],#o
        [0, 0, 0],#r
        [0, 0, 0],#p
        [0, 0, 0]]#z


operations = [["*", 1, 3], ["not*", 2, 3], ["*", 4, 5],  ["*", 0, 4], ["not*", 6, 7], ["not*", 4, 6], ["+", 8, 9]]

letters = ["a", "b", "c", "d", "l", "m", "h", "o", "r", "p", "z"]

for i in range(4):
    print("input start")
    ar[i][0] = int(input())
    print("input end")
    ar[i][2] = int(input())


for i in range(4):
    if ar[i][0] > ar[i][2]:
        ar[i][1] = 3
    elif ar[i][0] < ar[i][2]:
        ar[i][1] = 4
    elif ar[i][0] == 1 and ar[i][2] == 1:
        ar[i][1] = 1
    else:
        ar[i][1] = 0


for t in range(7):
    make_op(ar[t+4], t)


for t in range(11):
    if (ar[t][1] == 2) and (ar[t][0] == ar[t][2]):
        print(str(letters[t])+" "+str(ar[t])+" static")
        continue
    if (ar[t][1] == 2) and (ar[t][0] != ar[t][2]):
        print(str(letters[t])+" "+str(ar[t])+" dynamic")
        continue
    else:
        print(str(letters[t]) + " " + str(ar[t]))
