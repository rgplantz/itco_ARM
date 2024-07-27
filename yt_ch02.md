---
layout: default
title: Chapter 2
---
<style type="text/css">
    ol ol { list-style-type: lower-alpha; }
</style>

## Chapter 2

1.  Binary to hexadecimal
    1.  `0100 0101 0110 0111` = `4567`
    1.  `1000 1001 1010 1011` = `89ab`
    1.  `1111 1110 1101 1100` = `fedc`
    1.  `0000 0010 0101 0010` = `0252`

2.  Hexadecimal to binary
    1.  `83af` = `1000 0011 1010 1111`
    2.  `9001` = `1001 0000 0000 0001`
    3.  `aaaa` = `1010 1010 1010 1010`
    4.  `5555` = `0101 0101 0101 0101`

3.  Number of bits
    1.  `ffffffff`, 32 bits
    2.  `7fff58b7def0`, 48 bit
    3.  `1111` in binary is 4 bits
    4.  `1111` in hexadecimal is 16 bits

4.  Number of hexadecimal digits
    1.  8 bits, 2 hex digits
    2.  32 bits, 8 hex digits
    3.  64 bits, 16 hex digits
    4.  10 bits, 3 hex digits
    5.  20 bits, 5 hex digits
    6.  7 bits, 2 hex digits

5.  r = 10, n = 8, d<sub>7</sub> = 2, d<sub>6</sub> = 9, d<sub>5</sub> = 4, d<sub>4</sub> = 5, d<sub>3</sub> = 8, d<sub>2</sub> = 2, d<sub>1</sub> = 5, d<sub>0</sub> = 4 and r = 16, n = 8, d<sub>7</sub> = 2, d<sub>6</sub> = 9, d<sub>5</sub> = 4, d<sub>4</sub> = 5, d<sub>3</sub> = 8, d<sub>2</sub> = 2, d<sub>1</sub> = 5, d<sub>0</sub> = 4

6.  Binary to decimal
    1.  `1010 1010` = 170
    2.  `0101 0101` = 85
    3.  `1111 0000` = 240
    4.  `0000 1111` = 15
    5.  `1000 0000` = 128
    6.  `0110 0011` = 99
    7.  `0111 1011` = 123
    8.  `1111 1111` = 255

7.  Binary to decimal
    1.  `1010 1011 1100 1101` = 43981
    2.  `0001 0011 0011 0100` = 4916
    3.  `1111 1110 1101 1100` = 65244
    4.  `0000 0111 1101 1111` = 2015
    5.  `1000 0000 0000 0000` = 32768
    6.  `0000 0100 0000 0000` = 1024
    7.  `0111 1011 1010 1010` = 31658
    8.  `0011 0000 0011 1001` = 12345

8.  Hexadecimal to decimal
    1.  `a000` = 40960
    2.  `ffff` = 65535
    3.  `0400` = 1024
    4.  `1111` = 4369
    5.  `8888` = 34952
    6.  `0190` = 400
    7.  `abcd` = 43981
    8.  `5555` = 21845

9.  Unsigned decimal to hexadecimal
    1.  100 = `64`
    2.  123 = `7b`
    3.  10 = `0a`
    4.  88 = `58`
    5.  255 = `ff`
    6.  16 = `10`
    7.  32 = `20`
    8.  128 = `80`

10. Unsigned decimal to hexadecimal

    1.  1024 = `0400`
    2.  1000 = `03e8`
    3.  32768 = `8000`
    4.  32767 = `7fff`
    5.  256 = `0100`
    6.  65535 = `ffff`
    7.  4660 = `1234`
    8.  43981 = `abcd`

11. Uppercase A - F

    1.  A: `0x41`
    2.  B: `0x42`
    3.  C: `0x43`
    4.  D: `0x44`
    5.  E: `0x45`
    6.  F: `0x46`

12. Lowercase

    |char| code |char| code |char| code |char| code |char| code |
    |----|------|----|------|----|------|----|------|----|------|
    | a  |`0x61`| g  |`0x67`| m  |`0x6d`| s  |`0x73`| y  |`0x79`| 
    | b  |`0x62`| h  |`0x68`| n  |`0x6e`| t  |`0x74`| z  |`0x7a`|
    | c  |`0x63`| i  |`0x69`| o  |`0x6f`| u  |`0x75`|
    | d  |`0x64`| j  |`0x6a`| p  |`0x70`| v  |`0x76`|
    | e  |`0x65`| k  |`0x6b`| q  |`0x71`| w  |`0x77`|
    | f  |`0x66`| l  |`0x6c`| r  |`0x72`| x  |`0x78`|

13. Uppercase

    |char| code |char| code |char| code |char| code |char| code |
    |----|------|----|------|----|------|----|------|----|------|
    | A  |`0x41`| G  |`0x47`| M  |`0x4d`| S  |`0x53`| Y  |`0x59`| 
    | B  |`0x42`| H  |`0x48`| N  |`0x4e`| T  |`0x54`| Z  |`0x5a`|
    | C  |`0x43`| I  |`0x49`| O  |`0x4f`| U  |`0x55`|
    | D  |`0x44`| J  |`0x4a`| P  |`0x50`| V  |`0x56`|
    | E  |`0x45`| K  |`0x4b`| Q  |`0x51`| W  |`0x57`|
    | F  |`0x46`| L  |`0x4c`| R  |`0x52`| X  |`0x58`|

14. Punctuation

    |char| code |char| code |char| code |char| code |char| code |
    |----|------|----|------|----|------|----|------|----|------|
    |spc |`0x20`| '  |`0x27`| .  |`0x2e`| ?  |`0x3f`| ` |`0x60`|
    | !  |`0x21`| (  |`0x28`| /  |`0x2f`| @  |`0x40`| {  |`0x7b`|
    | "  |`0x22`| )  |`0x29`| :  |`0x3a`| [  |`0x5b`| }  |`0x7c`|
    | #  |`0x23`| *  |`0x2a`| ;  |`0x3b`| \\  |`0x5c`| \| |`0x7d`|
    | $  |`0x24`| +  |`0x2b`| <  |`0x3c`| ]  |`0x5d`| ~  |`0x7e`|
    | %  |`0x25`| ,  |`0x2c`| =  |`0x3d`| ^  |`0x5e`|
    | &  |`0x26`| -  |`0x2d`| >  |`0x3e`| _  |`0x5f`|

15. dec2Hex.c

```
// Convert from decimal to hexadecimal

#include <stdio.h>

int main(void)
{
    unsigned int value;

    printf("Decimal: ");
    scanf("%u", &value);
    printf("%u = 0x%02x\n", value, value);

    return 0;
}
```

16. hex2Dec.c

```
// Convert from hexadecimal to decimal

#include <stdio.h>

int main(void)
{
    unsigned int value;

    printf("Hexadecimal: ");
    scanf("%x", &value);
    printf("0x%02x = %u\n", value, value);

    return 0;
}
```

17. The integer is -1, and the string is `0xffffffff`.
