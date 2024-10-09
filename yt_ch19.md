---
layout: default
title: Chapter 19
---

## Chapter 19

1.  We can see that from the hexadecimal displays of the contents of `w19` and `w20` that the fractional part is in the low-order four bits of the register and the integral part in the high-order 28 bits.
    ```
    (gdb) b 28
    Breakpoint 1 at 0x7f8: file add_lengths.s, line 28.
    (gdb) r
    Starting program: /home/bob/add_lengths/add_lengths 
    [Thread debugging using libthread_db enabled]
    Using host libthread_db library "/lib/aarch64-linux-gnu/libthread_db.so.1".
    Enter length (inches and 1/16s)
            Inches: 12
        Sixteenths: 13
    Enter length (inches and 1/16s)
            Inches: 4 
        Sixteenths: 15
    Sum = 
    Breakpoint 1, main () at add_lengths.s:28
    28              add     w0, w20, w19              // Add lengths
    (gdb) i r w19 w20
    w19            0xcd                205
    w20            0x4f                79
    (gdb) 
    ```
2.  The decimal displays of the contents of `w19` and `w20` show the scaled values of the numbers we entered. Since these are decimal values, the integral and fractional parts are not aligned to bit positions in the register.
    ```
    (gdb) b 28
    Breakpoint 1 at 0x7f8: file add_money.s, line 28.
    (gdb) r
    Starting program: /home/bob/text_listings/add_money/add_money 
    [Thread debugging using libthread_db enabled]
    Using host libthread_db library "/lib/aarch64-linux-gnu/libthread_db.so.1".
    Enter amount (use same sign for dollars and cents)
      Dollars: 1
        Cents: 45
    Enter amount (use same sign for dollars and cents)
      Dollars: 2
        Cents: 67
    Sum = 
    Breakpoint 1, main () at add_money.s:28
    28              add     w0, w19, w20              // Add values
    (gdb) i r w19 w20
    w19            0x91                145
    w20            0x10b               267
    (gdb) 
    ```
3.  The scaled value of 214743647 + 1 is 214743648, which is a negative number is 32 bits.
    ```
    Enter amount (use same sign for dollars and cents)
      Dollars: 21474836
        Cents: 47
    Enter amount (use same sign for dollars and cents)
      Dollars: 0
        Cents: 01
    Sum = -$21474836.48
    ```
4.  My solution does not indicate when the sum goes to the next day. It just shoes an hour value greater than 24.
    ```asm
    ```
    ```asm
    ```
    ```asm
    ```
5.  Use doubles.
    ```c
    // Test the addition associativity of doubles.

    #include <stdio.h>
    #include <math.h>

    int main()
    {
        double x, y, z, sum1, sum2;

        printf("Enter a number: ");
        scanf("%lf", &x);
        printf("Enter a number: ");
        scanf("%lf", &y);
        printf("Enter a number: ");
        scanf("%lf", &z);
        
        sum1 = x + y;
        sum1 += z;      /* sum1 = (x + y) + z */
        sum2 = y + z;
        sum2 += x;      /* sum2 = x + (y + z) */

        if (sum1 == sum2)
          printf("%lf is the same as %lf\n", sum1, sum2);
        else
          printf("%lf is not the same as %lf\n", sum1, sum2);

        return 0;
    }
    ```
