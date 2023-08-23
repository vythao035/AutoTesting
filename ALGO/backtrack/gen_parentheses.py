class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        res = []
        curr = ""

        if not n:
            return res
        gen_parentheses(0, 0, n, curr, res)

        return res



def gen_parentheses(idx_open, idx_close, n, curr, res):
    if len(curr) == n*2:
        res.append(curr)
        return res

    if idx_open < n:
        gen_parentheses(idx_open + 1, idx_close, n, curr + "(", res)

    if idx_open > idx_close:
        gen_parentheses(idx_open, idx_close+1, n, curr + ")", res)


