---
layout: default
title: Chapter 3
---

## Chapter 3

### Page 42
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
<pre>
    Let carry = 0
    Repeat for each i = 0,...,(n - 1)  // starting in ones place
        sum<sub>i</sub> = (x<sub>i</sub> + y<sub>i</sub>) % 2           // remainder
        carry = (x<sub>i</sub> + y<sub>i</sub>) / 2         // integer division
</pre>
3. Hexadecimal addition
<pre>
    Let carry = 0
    Repeat for each i = 0,...,(n - 1)  // starting in ones place
        sum<sub>i</sub> = (x<sub>i</sub>) + y<sub>i</sub>) % 16           // remainder
        carry = (x<sub>i</sub> + y<sub>i</sub>) / 16         // integer division
</pre>
4. Binary subtraction
<pre>
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
</pre>
5. Hexadecimal subtracton
<pre>
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
</pre>

### Page 49
1. Signed decimal to two's complement binary.
<pre>
    If x >= 0
        Convert x to binary
    Else
        Negate x
        Convert the result to binary
        Compute the 2s complement of the result in the binary domain
</pre>
2. Two's complement in binary to signed decimal.
<pre>
    If high-order bit of x is 0
        Convert x to decimal
    Else
        Compute the 2s complement of x
        Compute the decimal equivalent of the result
        Place a minus sign in front of the decimal equivalent
</pre>
3. Two's complement binary to signed decimal
   * `0x1234` = +4660
   * `0xffff` = -1
   * `0x8000` = -32768
   * `0x7fff` = +32767
4. Signed decimal to 2s complement binary
   * +1024 = `0x0400`
   * -1024 = `0xfc00`
   * -256 = `0xff00`
   * -32767 `0x8001`

### Page 54
1. Three-bit arithmetic using Decoder Ring
   * Start at the tic mark for 1, move 3 tic marks CW, giving `100` = 4. We did not pass the tic mark at the top, so `CF` = `0`, and the result is right.
   * Start at the tic mark for 3, move 4 tic marks CW, giving `111` = 7. We did not pass the tic mark at the top, so `CF` = `0`, and the result is right.
   * Start at the tic mark for 5, move 6 tic marks CW, giving `011` = 3. We did pass the tic mark at the top, so `CF` = `1`, and the result is wrong.
   * Start at the tic mark for +1, move 3 tic marks CW, giving `101` = -3. We did pass the tic mark at the bottom, so `OF` = `1`, and the result is wrong.
   * Start at the tic mark for -3, move 3 tic marks CCW, giving `010` = +2. We did pass the tic mark at the bottom, so `OF` = `1`, and the result is wrong.
   * Start at the tic mark for +3, move 4 tic marks CCW, giving `111` = -1. We did not pass the tic mark at the bottom, so `OF` = `0`, and the result is right.
2. Eight-bit addition, unsigned and signed
   * `0x55` + `0xaa` = `0xff`, unsigned right, signed right
   * `0x55` + `0xf0` = `0x45`, unsigned wrong (`CF`), signed right
   * `0x80` + `0x7b` = `0xfb`, unsigned right, signed right
   * `0x63` + `0x7b` = `0xde`, unsigned right, signed wrong (`OF`)
   * `0x0f` + `0xff` = `0x0e`, unsigned wrong (`CF`), signed right
   * `0x80` + `0x80` = `0x00`, unsigned wrong (`CF`), signed wrong (`OF`)
3. Sixteen-bit addition, unsigned and signed
   * `0x1234` + `0xedcc` = `0x0000`, unsigned wrong (`CF`), signed right
   * `0x1234` + `0xfedc` = `0x1110`, unsigned wrong (`CF`), signed right
   * `0x8000` + `0x8000` = `0x0000`, unsigned wrong (`CF`), signed wrong (`OF`)
   * `0x0400` + `0xffff` = `0x03ff`, unsigned wrong (`CF`), signed right
   * `0x07d0` + `0x782f` = `0x7fff`, unsigned right, signed right
   * `0x8000` + `0xffff` = `0x7fff`, unsigned wrong (`CF`), signed wrong (`OF`)

