def exchange_coin(n, memo={}):
    if n == 0:
        return 0
    if n in memo:
        return memo[n]
    exchange_value = exchange_coin(n//2) + exchange_coin(n//3) + exchange_coin(n//4)
    memo[n] = max(n, exchange_value)
    return memo[n]

if __name__ == '__main__':
    while True:
        try:
            n = int(input())
            print(exchange_coin(n))
        except EOFError:
            break

