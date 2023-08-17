class Solution:
    def containsCycle(self, grid: List[List[str]]) -> bool:
        directions = [(0, 1), (0, -1), (-1, 0), (1, 0)]
        n_row, n_col = len(grid), len(grid[0])
        visited = []
        for i in range(n_row):
            for j in range(n_col):
                if (i, j) not in visited:
                    visited.append((i, j))
                    queue = [(i, j, 0, 0)]
                    while queue:
                        cur_row, cur_col, pre_row, pre_col = queue.pop()
                        for x, y in directions:
                            next_row = cur_row + x
                            next_col = cur_col + y
                            if (next_row in range(n_row) and next_col in range(n_col)
                                and (next_row, next_col) != (pre_row, pre_col)
                                and grid[next_row][next_col] == grid[cur_row][cur_col]):
                                if (next_row, next_col) not in visited:
                                    visited.append((next_row, next_col))
                                    queue += [(next_row, next_col, cur_row, cur_col)]
                                else:
                                    return True
        return False