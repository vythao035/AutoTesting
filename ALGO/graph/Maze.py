class Solution:
    def nearestExit(self, maze: List[List[str]], entrance: List[int]) -> int:
        n_row, n_col = len(maze), len(maze[0])
        directions = [(0, 1), (0, -1), (-1, 0), (1, 0)]
        entrance = (entrance[0], entrance[1])
        exits = find_exit(maze)
        if entrance in exits:
            exits.remove(entrance)

        queue = []
        queue.append((entrance, 0))
        maze[entrance[0]][entrance[1]] = "1"
        while queue:
            (cur_row, cur_col), distance = queue.pop(0)
            if (cur_row, cur_col) in exits:
                return distance
            for x, y in directions:
                next_row = cur_row + x
                next_col = cur_col + y
                if next_row in range(n_row) and next_col in range(n_col):
                    if maze[next_row][next_col] == ".":
                        queue.append(((next_row, next_col), distance + 1))
                        maze[next_row][next_col] = "1"

        return -1


def find_exit(maze: List[List[str]]):
    n_row, n_col = len(maze), len(maze[0])
    exits = set()
    for i in range(n_row):
        if maze[i][0] == ".":
            exits.add((i, 0))
        if maze[i][n_col - 1] == ".":
            exits.add((i, n_col - 1))

    for i in range(n_col):
        if maze[0][i] == ".":
            exits.add((0, i))
        if maze[n_row - 1][i] == ".":
            exits.add((n_row - 1, i))

    return exits