---
layout: default
title: Chapter 16
---

## Chapter 16

1.  No answer required.
2.  Sum integers
    ```c
    // Add two unsigned integers and show if there is carry.
    #include <stdio.h>
    #include "add_two.h"

    int main(void)
    {
        unsigned int x, y, z, carry;
      
        printf("Enter an integer: ");
        scanf("%u", &x);
        printf("Enter an integer: ");
        scanf("%u", &y);
        carry = add_two(&z, x, y);
        printf("%u + %u = %u\n", x, y, z);
        if (carry)
            printf("** Carry occurred **\n");

        return 0;
    }
    ```
    ```
    // Add two unsigned ntegers and return 1 for carry, 0 for no carry.

    #ifndef ADD_TWO_H
    #define ADD_TWO_H
    unsigned int add_two(unsigned int *a, unsigned int b, unsigned int c);
    #endif
    ```
    ```
    // Add two unsigned integers and return 1 for carry, 0 for no carry.

    #include "add_two.h"

    unsigned int add_two(unsigned int *a, unsigned int b, unsigned int c)
    {
        unsigned int sum;
        unsigned int carry = 0;   // Assume no carry
      
        sum = b + c;
        if ((sum < b) || (sum < c)) {   // sum wraps if carry
            carry = 1;
        }
        *a = sum;

        return carry;
    }
    ```
3.  Inline assembly to detect carry.
    ```c
    // Add two integers and show if there is carry.

    #include <stdio.h>

    int main(void)
    {
        unsigned int x, y, z, carry;
      
        printf("Enter an integer: ");
        scanf("%u", &x);
        printf("Enter an integer: ");
        scanf("%u", &y);

        asm ("adds %w0, %w2, %w3\n"
            "cinc %w1, wzr, cs"
            : "=r" (z), "=r" (carry)
            : "r" (x), "r" (y));

        printf("%u + %u = %u\n", x, y, z);
        if (carry)
            printf("** Carry occurred **\n");

        return 0;
    }
    ```
4.  Registers for variables.
    ```
    // Add two integers and show if there is overflow.

    #include <stdio.h>

    int main(void)
    {
        int x, y;
        register int z, overflow;
      
        printf("Enter an integer: ");
        scanf("%i", &x);
        printf("Enter an integer: ");
        scanf("%i", &y);

        asm ("adds %w0, %w2, %w3\n"
            "cinc %w1, wzr, vs"
            : "=r" (z), "=r" (overflow)
            : "r" (x), "r" (y));

        printf("%i + %i = %i\n", x, y, z);
        if (overflow)
            printf("** Overflow occurred **\n");

        return 0;
    }
    ```
