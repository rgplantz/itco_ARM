---
layout: default
title: Chapter 6
---

## Chapter 6

### Page 120
The circuit for the four status flags is
![](./assets/images/ch_06/status_flags.svg)

### Page 123
Instead of selecting one output line like the decoder in Figure 6-8, a BCD to seven-segment decoder selects several of the seven output lines for each 4-bit BCD input.

We start with a truth table that shows which segments are activated to display the numeral, 0 -- 9, corresponding to the four x<sub>i</sub> BCD bits.
        
|Digit|x<sub>3</sub>|x<sub>2</sub>|x<sub>1</sub>|x<sub>0</sub>| a | b | c | d | e | f | g |
|-----|-------------|-------------|-------------|-------------|---|---|---|---|---|---|---|
|  0  |     `0`     |     `0`     |     `0`     |     `0`     |`1`|`1`|`1`|`1`|`1`|`1`|`0`|
|  1  |     `0`     |     `0`     |     `0`     |     `1`     |`0`|`1`|`1`|`0`|`0`|`0`|`0`|
|  2  |     `0`     |     `0`     |     `1`     |     `0`     |`1`|`1`|`0`|`1`|`1`|`0`|`1`|
|  3  |     `0`     |     `0`     |     `1`     |     `1`     |`1`|`1`|`1`|`1`|`0`|`0`|`1`|
|  4  |     `0`     |     `1`     |     `0`     |     `0`     |`0`|`1`|`1`|`0`|`0`|`1`|`1`|
|  5  |     `0`     |     `1`     |     `0`     |     `1`     |`1`|`0`|`1`|`1`|`0`|`1`|`1`|
|  6  |     `0`     |     `1`     |     `1`     |     `0`     |`1`|`0`|`1`|`1`|`1`|`1`|`1`|
|  7  |     `0`     |     `1`     |     `1`     |     `1`     |`1`|`1`|`1`|`0`|`0`|`0`|`0`|
|  8  |     `1`     |     `0`     |     `0`     |     `0`     |`1`|`1`|`1`|`1`|`1`|`1`|`1`|
|  9  |     `1`     |     `0`     |     `0`     |     `1`     |`1`|`1`|`1`|`1`|`0`|`1`|`1`|
        
The functional relationship between the four inputs and each of the seven outputs can be expressed as a sum of minterms.

a(x) = &sum;(0,2,3,5,6,7,8,9)<br/>
b(x) = &sum;(0,1,2,3,4,7,8,9)<br/>
c(x) = &sum;(0,1,3,4,5,6,7,8,9)<br/>
d(x) = &sum;(0,2,3,5,6,8)<br/>
e(x) = &sum;(0,2,6,8)<br/>
f(x) = &sum;(0,4,5,6,8,9)<br/>
g(x) = &sum;(2,3,4,5,6,8,9)
    
We'll use Karnaugh maps to simplify the functions for each of the seven segments.
![](./assets/images/ch_06/7segment_a.svg)
a(x) = x<sub>1</sub> &or; x<sub>3</sub> &or; (&not;x<sub>0</sub> &and; &not;x<sub>2</sub>) &or; (x<sub>0</sub> &and; x<sub>2</sub>)

![](./assets/images/ch_06/7segment_b.svg)
b(x) = &not;x<sub>2</sub> &or;  (&not;x<sub>0</sub> &and; &not;x<sub>1</sub>) &or; (x<sub>0</sub> &and; x<sub>1</sub>)

![](./assets/images/ch_06/7segment_c.svg)
c(x) = x<sub>0</sub> &or; &not;x<sub>1</sub> &or; x<sub>2</sub>

![](./assets/images/ch_06/7segment_d.svg)
d(x) = x<sub>3</sub> &or; (&not;x<sub>0</sub> &and; &not;x<sub>2</sub>) &or; (x<sub>1</sub> &and; &not;x<sub>2</sub>) &or; (&not;x<sub>0</sub> &and; x<sub>1</sub>) &or; (x<sub>0</sub> &and; &not;x<sub>1</sub> &and; x<sub>2</sub>)

![](./assets/images/ch_06/7segment_e.svg)
e(x) = (&not;x<sub>0</sub> &and; &not;x<sub>2</sub>) &or; (&not;x<sub>0</sub> &and; x<sub>1</sub>)

![](./assets/images/ch_06/7segment_f.svg)
f(x) = x<sub>3</sub> &or; (&not;x<sub>0</sub> &and; &not;x<sub>1</sub>) &or; (&not;x<sub>0</sub> &and; x<sub>2</sub>) &or; (&not;x<sub>1</sub> &and; x<sub>2</sub>)

![](./assets/images/ch_06/7segment_g.svg)
 g(x) = x<sub>3</sub> &or; (&not;x<sub>0</sub> &and; x<sub>1</sub>) &or; (x<sub>1</sub> &and; &not;x<sub>2</sub>) &or; (&not;x<sub>1</sub> &and; x<sub>2</sub>)

This leads to a circuit for our decoder.

![](./assets/images/ch_06/7segment_decoder.svg)

### Page 132
  We start with a truth table that shows the relationship of x compared to y. (Remember that GT and LT refer to signed values.)
        
|x<sub>1</sub>|x<sub>0</sub>|y<sub>1</sub>|y<sub>0</sub>| EQ | GT | LT |
|-------------|-------------|-------------|-------------|----|----|----|
|     `0`     |     `0`     |     `0`     |     `0`     |`1` |`0` |`0` |
|     `0`     |     `0`     |     `0`     |     `1`     |`0` |`0` |`1` |
|     `0`     |     `0`     |     `1`     |     `0`     |`0` |`1` |`0` |
|     `0`     |     `0`     |     `1`     |     `1`     |`0` |`1` |`0` |
|     `0`     |     `1`     |     `0`     |     `0`     |`0` |`1` |`0` |
|     `0`     |     `1`     |     `0`     |     `1`     |`1` |`0` |`0` |
|     `0`     |     `1`     |     `1`     |     `0`     |`0` |`1` |`0` |
|     `0`     |     `1`     |     `1`     |     `1`     |`0` |`1` |`0` |
|     `1`     |     `0`     |     `0`     |     `0`     |`0` |`0` |`1` |
|     `1`     |     `0`     |     `0`     |     `1`     |`0` |`0` |`1` |
|     `1`     |     `0`     |     `1`     |     `0`     |`1` |`0` |`0` |
|     `1`     |     `0`     |     `1`     |     `1`     |`0` |`0` |`1` |
|     `1`     |     `1`     |     `0`     |     `0`     |`0` |`0` |`1` |
|     `1`     |     `1`     |     `0`     |     `1`     |`0` |`0` |`1` |
|     `1`     |     `1`     |     `1`     |     `0`     |`0` |`1` |`0` |
|     `1`     |     `1`     |     `1`     |     `1`     |`1` |`0` |`0` |

  We can specify the connections in the PLD for our comparator directly from the truth table.
  
 ![](./assets/images/ch_06/comparator.svg)
