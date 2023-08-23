class Solution:

    def letterCombinations(self, digits: str) -> List[str]:
        mapping = {
            '2': 'abc',
            '3': 'def',
            '4': 'ghi',
            '5': 'jkl',
            '6': 'mno',
            '7': 'pqrs',
            '8': 'tuv',
            '9': 'wxyz'
        }

        res = []
        curr = ""

        if not digits:
            return res
        else:
            combination_phone(0, digits, mapping, curr, res);
        return res


def combination_phone(index, digits, mapping, curr, res):
    if index == len(digits):
        res.append(curr)
        return res

    digit = digits[index]
    letters = mapping[digit]
    for letter in letters:
        combination_phone(index+1, digits, mapping, curr + letter, res)


