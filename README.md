Inspired by https://www.youtube.com/watch?v=Wim9WJeDTHQ

# Persistence

>In mathematics, the persistence of a number is the number of times one must apply a given operation to an integer before reaching a fixed point at which the operation no longer alters the number.
Usually, this involves additive or multiplicative persistence of an integer, which is how often one has to replace the number by the sum or product of its digits until one reaches a single digit. Because the numbers are broken down into their digits, the additive or multiplicative persistence depends on the radix.

Persistence of a number. (n.d.). In Wikipedia. Retrieved March 25, 2019, from https://en.wikipedia.org/wiki/Persistence_of_a_number

## Multiplicative Persistence

Smallest number of multiplicative persistence n.

It is conjectured that there is no base-10 number with persistence greater than 11, but no proof exists.
Numbers up to 10^1500 were tested by Stephanie Perez and Robert Styer (Persistence: A Digit Problem 2013)

More information on https://oeis.org/A003001

### Sequence

`0, 10, 25, 39, 77, 679, 6788, 68889, 2677889, 26888999, 3778888999, 277777788888899`

### Detail

0 time:

```
0:
0
```

1 time:

```
10:
1 * 0 = 0
```

2 times:

```
25:
2 * 5 = 10
1 * 0 =  0
```

3 times:

```
39:
3 * 9 = 27
2 * 7 = 14
1 * 4 =  4
```

4 times:

```
77:
7 * 7 = 49
4 * 9 = 36
3 * 6 = 18
1 * 8 =  8
```

5 times:

```
679:
6 * 7 * 9 = 378
3 * 7 * 8 = 168
1 * 6 * 8 =  48
    4 * 8 =  32
    3 * 2 =  06
```

## Additive Persistence

Smallest number of additive persistence n.

More information on https://oeis.org/A006050

### Sequence

`0, 10, 19, 199, 19999999999999999999999`

### Detail

0 time:

```
0:
0 = 0
```

1 time:

```
10:
1 + 0 = 1
```

2 times:

```
19:
1 + 9 = 10
1 + 0 =  1
```

3 times:

```
199:
1 + 9 + 9 = 19
    1 + 9 = 10
    1 + 0 =  1
```
