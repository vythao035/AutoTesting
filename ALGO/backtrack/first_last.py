# cook your dish here
num_tests = int(input())

for i in range(num_tests):
    length = int(input())
    array = [int(i) for i in input().split(" ")]

    res = array[0] + array[-1]
    for i in range(1, length):
        res = max(res, array[i] + array[i - 1])

    print(res)