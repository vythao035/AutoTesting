class Solution:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        nums.sort()
        cur = []
        res = []
        subs(0, nums, cur, res)
        print(res)

def subs(i, nums, curr, res):
    if i >= len(nums):
        if curr not in res:
            res.append(curr)
        return

    subs(i + 1, nums, curr + [nums[i]], res)
    subs(i + 1, nums, curr, res)