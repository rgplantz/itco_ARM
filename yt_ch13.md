---
layout: default
title: Chapter 13
---

## Chapter 13

1.  The compiler generates the same assembly language for the `while` and `for` loops. The difference is only in the C syntax. Both the `while` and `for` loops branch to the bottom of the loop body, where the loop termination condition is tested before branching to the top of the loop body:
    ```
            b	     .L2
    .L3:
            mov	    x2, 1
            ldr	    x1, [sp, 24]
            mov	    w0, 1
            bl	    write
            ldr	    x0, [sp, 24]
            add	    x0, x0, 1
            str	    x0, [sp, 24]
    .L2:
            ldr	    x0, [sp, 24]
            ldrb	  w0, [x0]
            cmp	    w0, 0
            bne	    .L3
    ```
    The `do-while` loop executes the loop body before testing the loop termination condition:
    ```
    .L2:
            mov	    x2, 1
            ldr	    x1, [sp, 24]
            mov	    w0, 1
            bl	    write
            ldr	    x0, [sp, 24]
            add	    x0, x0, 1
            str	    x0, [sp, 24]
            ldr	    x0, [sp, 24]
            ldrb	  w0, [x0]
            cmp	    w0, 0
            bne	    .L2
    ```
2.  Changing to 64-bit registers doesn't change the limits on constants.
3.  I wrote a simple program to illustrate how C allows larger constants.
    ```c
    // Display a large constant.

    #include <stdio.h>

    int main(void)
    {
        int an_int = 1000000000;

        printf("The integer is %i\n", an_int);

        return 0;
    }
    ```
