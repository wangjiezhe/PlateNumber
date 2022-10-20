#!/usr/bin/env python

import pandas as pd
import string
from sympy import isprime
from sympy.ntheory import reduced_totient
from itertools import chain
from functools import partial
from collections import Counter
from pprint import pprint

CSV_NAME = "Cangzhou.csv"


def available_numbers():
    df = pd.read_csv(CSV_NAME)
    return chain.from_iterable([generate_number(x) for x in df['number']])


def prime_numbers():
    return map(base36_encode, filter(isprime, map(base36_decode, available_numbers())))


def pseudoprime_numbers(base: int = 2):
    return map(
        base36_encode,
        filter(
            partial(is_pseudoprime, base=base), map(base36_decode, available_numbers())
        ),
    )


def carmichael_numbers():
    return map(
        base36_encode, filter(is_carmichael, map(base36_decode, available_numbers()))
    )


def generate_number(xxx: str):
    return (
        xxx[0] + xxx[1] + str(i) + xxx[2] + str(j) for i in range(10) for j in range(10)
    )


def base36_encode(number: int):
    num_str = string.digits + string.ascii_uppercase
    if number == 0:
        return '0'

    base36 = []
    while number != 0:
        number, i = divmod(number, 36)
        base36.append(num_str[i])

    return ''.join(reversed(base36))


def base36_decode(number: str):
    return int(number, 36)


def is_pseudoprime(n: int, base: int = 2):
    return (not isprime(n)) and pow(base, n - 1, n) == 1


def is_carmichael(n: int):
    return (not isprime(n)) and n % reduced_totient(n) == 1  # type: ignore


def main():
    print("素数表：")
    print(list(prime_numbers()))

    # for i in range(2, 1000):
    #     res = list(pseudoprime_numbers(base=i))
    #     if len(res) > 0:
    #         print("伪素数（模{}）表：".format(i))
    #         print(res)

    print("伪素数表：")
    res = Counter(chain.from_iterable(pseudoprime_numbers(i) for i in range(2, 3600)))
    pprint(res.most_common())

    res = list(carmichael_numbers())
    if len(res) > 0:
        print("卡迈克尔数表：")
        print(res)


if __name__ == "__main__":
    main()
