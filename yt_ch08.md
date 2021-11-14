---
layout: default
title: Chapter 8
---

## Chapter 8

### Page 176
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
