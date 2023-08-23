# cook your dish here
def find_max_dollar(coin_Byte):
    print(coin_Byte)
    if coin_Byte < 12:
        return coin_Byte
    else:
        coin_tmp = find_max_dollar(coin_Byte // 2) + find_max_dollar(coin_Byte // 3) + find_max_dollar(coin_Byte // 4)
        return coin_tmp


if __name__ == '__main__':
    while True:
        try:
            coin_Byte = int(input())
            coin_dollar = find_max_dollar(coin_Byte)
            print(coin_dollar)
        except EOFError:
            break


