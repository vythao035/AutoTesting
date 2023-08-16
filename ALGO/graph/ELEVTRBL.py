import collections

if __name__ == '__main__':
    queue = []
    visited = []
    input_str = input().split(" ")
    [f, s, g, u, d] = [int(i) for i in input_str]

    for i in range(f + 1):
        visited.append(0)

    if s == g:
        print(0)
    else:
        visited[s] = 1
        queue.append(s)

        while len(queue) > 0:
            cur_f = queue.pop()

            if cur_f + u <= f and visited[cur_f + u] == 0:
                visited[cur_f + u] = visited[cur_f] + 1
                queue.append(cur_f + u)

            if cur_f - d >= 1 and visited[cur_f - d] == 0:
                visited[cur_f - d] = visited[cur_f] + 1
                queue.append(cur_f - d)

        if visited[g] != 0:
            print(visited[g] - 1)
        else:
            print("use the stairs")
