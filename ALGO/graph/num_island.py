
from typing import List
class Solution:

    def numIslands(self, grid: List[List[str]]) -> int:
        num_island = 0
        n_row, n_col = len(grid), len(grid[0])
        queue = []

        for i in range(n_row):
            for j in range(n_col):
                if grid[i][j] == "1":
                    grid[i][j] = "2"
                    queue.append((i, j))
                    num_island = num_island + 1
                bfs(grid, queue, i, j)

        return num_island


def bfs(grid: List[List[str]], queue, x, y):
    n_row, n_col = len(grid), len(grid[0])
    directions = [(0, 1), (0, -1), (-1, 0), (1, 0)]

    while len(queue) > 0:
        c_row, c_col = queue.pop()
        for x, y in directions:
            next_row, next_col = c_row + x, c_col + y
            if next_row in range(n_row) and next_col in range(n_col):
                print(next_row, next_col)
                if grid[next_row][next_col] == "1":
                    grid[next_row][next_col] = "2"
                    queue.append((next_row, next_col))