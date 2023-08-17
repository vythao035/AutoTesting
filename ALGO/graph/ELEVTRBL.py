# your code goes here
if __name__ == '__main__':
    input_str = input().split(" ")
    [f, s, g, u, d] = [int(i) for i in input_str]
    visited = [0 for i in range(f + 1)]
    queue = []

    visited[s] = 0
    queue.append(s)

    while queue:
        cur_f = queue.pop(0)

        if cur_f == g:
            print(visited[cur_f])
            break
        if cur_f + u <= f and visited[cur_f + u] == 0:
            visited[cur_f + u] = visited[cur_f] + 1
            queue.append(cur_f + u)

        if cur_f - d >= 1 and visited[cur_f - d] == 0:
            visited[cur_f - d] = visited[cur_f] + 1
            queue.append(cur_f - d)

    if visited[g] == 0:
        print("use the stairs")
