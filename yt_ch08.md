---
layout: default
title: Chapter 10
---

## Chapter 10

### Page aa
1.  After setting `rbp` equal to `rsp`, the program does n't change either of the regsters. So the `mov rsp, rbp` instruction does not change the contents of the registers. When we change the program to return 123, `gdb` ends with the message
    
    `Inferior 1 (process 4891) exited with code 0173]`
    
    The exit code begins with a `0` showing that it's in the octal base: 173<sub>8</sub> = 123<sub>10</sub>
2.  xxx
3.  yyy
4.  zzz
5.  


### Page bb
We start with a truth table that shows the relationships between the signals and the input to the D flip-flop.
        
|Store|d<sub>i</sub>|r<sub>i</sub>|D<sub>i</sub>|
|-----|-------------|-------------|-------------|
| `0` |     `0`     |     `0`     |     `0`     |
| `0` |     `0`     |     `1`     |     `1`     |
| `0` |     `1`     |     `0`     |     `0`     |
| `0` |     `1`     |     `1`     |     `1`     |
| `1` |     `0`     |     `0`     |     `0`     |
| `1` |     `0`     |     `1`     |     `0`     |
| `1` |     `1`     |     `0`     |     `1`     |
| `1` |     `1`     |     `1`     |     `1`     |

Using a Karnaugh map:      
![](./assets/images/ch_08/1-bit_to_D.svg)

we get:

D<sub>i</sub>(Store, d<sub>i</sub>, r<sub>i</sub>) = (&not;Store &and; r<sub>i</sub>) &or; (Store &and; d<sub>i</sub>)

Applying De Morgan's law:

&not;D<sub>i</sub>(Store, d<sub>i</sub>, r<sub>i</sub>) = &not;(&not;Store &and; r<sub>i</sub>) &and; &not;(Store &and; d<sub>i</sub>)

And complementing both sides gives us:

D<sub>i</sub>(Store, d<sub>i</sub>, r<sub>i</sub>) = &not;(&not;(&not;Store &and; r<sub>i</sub>) &and; &not;(Store &and; d<sub>i</sub>))

So we can use NAND gates. Notice the placement of the parentheses when manipulating the expressions in the equations here. De Morgan's law applies to the individual terms in the expression. In the final complementing of both sides of the equation, we're complementing the entire expression on the righthand side of the equation.
