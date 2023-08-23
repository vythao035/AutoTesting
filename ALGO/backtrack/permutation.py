class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        res = []
        curr = []

        if not nums:
            return res
        permutation(0, nums, curr, res)
        return res

def permutation(idx, nums, curr, res):
    if curr not in res:
        res.append(curr)

    permutation(idx + 1, nums, curr + nums[idx], res)
    permutation(idx + 1, nums, curr, res)