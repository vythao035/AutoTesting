class Solution:
    def floodFill(self, image: List[List[int]], sr: int, sc: int, color: int) -> List[List[int]]:
        n_row, n_col = len(image), len(image[0])

        directions = [(0, 1), (0, -1), (-1, 0), (1, 0)]

        visited = set([(sr, sc)])

        queue = []
        queue.append((sr, sc))

        while len(queue) > 0:
            c_row, c_col = queue.pop()

            pre_color = image[c_row][c_col]

            image[c_row][c_col] = color

            for x, y in directions:
                next_row, next_col = c_row + x, c_col +y

                if ((next_row, next_col) not in visited
                    and next_row in range(n_row) and next_col in range(n_col)
                    and image[next_row][next_col] == pre_color):

                    queue.append((next_row, next_col))
                    visited.add((next_row, next_col))

        return image