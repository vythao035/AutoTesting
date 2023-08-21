class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        res = []
        curr = []
        subs(0, nums, curr, res)
        return res


def subs(i, nums, curr, res):
    if i >= len(nums):
        res.append(curr)
        return

    subs(i + 1, nums, curr + [nums[i]], res)
    subs(i + 1, nums, curr, res)