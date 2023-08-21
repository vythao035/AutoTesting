class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        candidates.sort()
        curr = []
        res = []
        subs(0, candidates, curr, res, target)
        return res

def subs(i, candidates, curr, res, target):
    s = sum(curr)
    if s==target:
        if curr not in res:
            res.append(curr)
    elif s < target:
        subs(i + 1, candidates, curr + [candidates[i]], res)
        subs(i + 1, candidates, curr, res)