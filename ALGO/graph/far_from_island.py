from typing import List
class Solution:
    def maxDistance(self, grid: List[List[int]]) -> int:
        n_row, n_col = len(grid), len(grid[0])
        directions = [(0, 1), (0, -1), (-1, 0), (1, 0)]

        islands = find_island(grid)
        visited = []

        while islands:
            cur_row, cur_col, distance = islands.pop(0)
            visited.append((cur_row, cur_col))
            for x, y in directions:
                next_row = cur_row + x
                next_col = cur_col + y

                if (next_row in range(n_row) and next_col in range(n_col)
                        and (next_row, next_col) not in visited):
                    pass



def find_island(grid: List[List[int]]):
    n_row, n_col = len(grid), len(grid[0])
    islands = []
    for i in range(n_row):
        for j in range(n_col):
            if grid[i][j] == 1:
                islands.append((i, j, 0))
    return islands
