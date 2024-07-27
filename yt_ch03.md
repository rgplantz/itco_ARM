---
layout: default
title: Chapter 3
---
<style type="text/css">
    ol ol { list-style-type: lower-alpha; }
</style>

## Chapter 3

1. Four bits are required to store a single decimal digit.
   Many codes could be used. This one uses the binary number system.

    |digit| code |digit| code |
    |-----|------|-----|------|
    |  0  |`0000`|  5  |`0101`|
    |  1  |`0001`|  6  |`0110`|
    |  2  |`0010`|  7  |`0111`|
    |  3  |`0011`|  8  |`1000`|
    |  4  |`0100`|  9  |`1001`|

2. Binary addition

        Let carry = 0
        Repeat for each i = 0,...,(n - 1)  // starting in ones place
            sum<sub>i</sub> = (x<sub>i</sub> + y<sub>i</sub>) % 2           // remainder
            carry = (x<sub>i</sub> + y<sub>i</sub>) / 2         // integer division

3. Hexadecimal addition

        Let carry = 0
        Repeat for each i = 0,...,(n - 1)  // starting in ones place
            sum<sub>i</sub> = (x<sub>i</sub>) + y<sub>i</sub>) % 16           // remainder
            carry = (x<sub>i</sub> + y<sub>i</sub>) / 16         // integer division

4. Binary subtraction

        Let borrow = 0
        Repeat for i = 0,··· ,(N − 1)
        If y<sub>i</sub> ≤ x<sub>i</sub> 
            Let difference<sub>i</sub> = x<sub>i</sub> − y<sub>i</sub>
        Else
            Let j = i + 1
            While (x<sub>i</sub> = 0) and (j < N)
                Add 1 to j
            If j = N
                Let borrow = 1
                Subtract 1 from j
                Add 2 to x<sub>i</sub>
            While j > i
                Subtract 1 from x<sub>i</sub>
                Subtract 1 from j
                Add 2 to x<sub>i</sub>
            Let difference<sub>i</sub> = x<sub>i</sub> − y<sub>i</sub>

5. Hexadecimal subtraction

        Let borrow = 0
        Repeat for i = 0,··· ,(N − 1)
        If y<sub>i</sub> ≤ x<sub>i</sub> 
            Let difference<sub>i</sub> = x<sub>i</sub> − y<sub>i</sub>
        Else
            Let j = i + 1
            While (x<sub>i</sub> = 0) and (j < N)
                Add 1 to j
            If j = N
                Let borrow = 1
                Subtract 1 from j
                Add 16 to x<sub>i</sub>
            While j > i
                Subtract 1 from x<sub>i</sub>
                Subtract 1 from j
                Add 16 to x<sub>i</sub>
            Let difference<sub>i</sub> = x<sub>i</sub> − y<sub>i</sub>

6. Signed decimal to two's complement binary

        If x >= 0
            Convert x to binary
        Else
            Negate x
            Convert the result to binary
            Compute the 2s complement of the result in the binary domain

7. Two's complement in binary to signed decimal

        If high-order bit of x is 0
            Convert x to decimal
        Else
            Compute the 2s complement of x
            Compute the decimal equivalent of the result
            Place a minus sign in front of the decimal equivalent

8.  Two's complement binary to signed decimal
    1. `0x1234` = +4660
    2. `0xffff` = -1
    3. `0x8000` = -32768
    4. `0x7fff` = +32767

9.  Signed decimal to 2s complement binary
    1. +1024 = `0x0400`
    2. -1024 = `0xfc00`
    3. -256 = `0xff00`
    4. -32767 `0x8001`

10. Three-bit arithmetic using Decoder Ring
    1. Start at the tic mark for 1, move 3 tic marks CW, giving `100` = 4. We did not pass the tic mark at the top, so `CF` = `0`, and the result is right.
    2. Start at the tic mark for 3, move 4 tic marks CW, giving `111` = 7. We did not pass the tic mark at the top, so `CF` = `0`, and the result is right.
    3. Start at the tic mark for 5, move 6 tic marks CW, giving `011` = 3. We did pass the tic mark at the top, so `CF` = `1`, and the result is wrong.
    4. Start at the tic mark for +1, move 3 tic marks CW, giving `101` = -3. We did pass the tic mark at the bottom, so `OF` = `1`, and the result is wrong.
    5. Start at the tic mark for -3, move 3 tic marks CCW, giving `010` = +2. We did pass the tic mark at the bottom, so `OF` = `1`, and the result is wrong.
    6. Start at the tic mark for +3, move 4 tic marks CCW, giving `111` = -1. We did not pass the tic mark at the bottom, so `OF` = `0`, and the result is right.

11. Eight-bit addition, unsigned and signed
    1. `0x55` + `0xaa` = `0xff`, unsigned right, signed right
    2. `0x55` + `0xf0` = `0x45`, unsigned wrong (`CF`), signed right
    3. `0x80` + `0x7b` = `0xfb`, unsigned right, signed right
    4. `0x63` + `0x7b` = `0xde`, unsigned right, signed wrong (`OF`)
    5. `0x0f` + `0xff` = `0x0e`, unsigned wrong (`CF`), signed right
    6. `0x80` + `0x80` = `0x00`, unsigned wrong (`CF`), signed wrong (`OF`)

12. Sixteen-bit addition, unsigned and signed
    1. `0x1234` + `0xedcc` = `0x0000`, unsigned wrong (`CF`), signed right
    2. `0x1234` + `0xfedc` = `0x1110`, unsigned wrong (`CF`), signed right
    3. `0x8000` + `0x8000` = `0x0000`, unsigned wrong (`CF`), signed wrong (`OF`)
    4. `0x0400` + `0xffff` = `0x03ff`, unsigned wrong (`CF`), signed right
    5. `0x07d0` + `0x782f` = `0x7fff`, unsigned right, signed right
    6. `0x8000` + `0xffff` = `0x7fff`, unsigned wrong (`CF`), signed wrong (`OF`)
