---
layout: default
title: Chapter 11
---

## Chapter 11

1.  The `diff` command shows that optimizing for speed (`-Ofast`) causes the compiler to align the constant data on address boundaries such that it loads faster.
    ```
    $ diff inc_int_1.s inc_int_2.s 
    4,5c4
    <       .section        .rodata.str1.8,"aMS",@progbits,1
    <       .align  3
    ---
    >       .section        .rodata.str1.1,"aMS",@progbits,1
    8d6
    <       .align  3
    11d8
    <       .align  3
    16d12
    <       .p2align 4,,11
    ```
    Both optimizations use a faster algorithm to add 1 to the integer. With no optimization the addition is performed in `w0` and then moved to `w1` for the call to `printf`:
    ```
    ldr     w0, [sp, 28]
    add     w0, w0, 1
    str     w0, [sp, 28]
    ldr     w0, [sp, 28]
    mov     w1, w0
    adrp    x0, .LC2
    add     x0, x0, :lo12:.LC2
    bl	    printf
    ```
    Both optimizations load the integer directly into `w1` and perform the addition there:
    ```
    ldr	    w1, [sp, 28]
    adrp	  x0, .LC2
    add	    x0, x0, :lo12:.LC2
    add	    w1, w1, 1
    str	    w1, [sp, 28]
    bl	    printf
    ```
2.  Add and subtract two integers.
    * add_sub.s
      ```asm
      // Add and subtract two integers.
              .arch armv8-a
      // Stack frame
              .equ    x, 16
              .equ    y, 20
              .equ    sum, 24
              .equ    diff, 28
              .equ    FRAME, 32
      // Constants 
              .section .rodata
      prompt:
              .string "Enter an integer: "
      input_format:
              .string "%i"
      result:
              .string "Sum = %i, Difference = %i\n"
      // Code
              .text
              .align  2
              .global main
              .type   main, %function
      main:
              stp     fp, lr, [sp, FRAME]!  // Create stack frame
              mov     fp, sp                // Set our frame pointer

              adr     x0, prompt            // prompt user
              bl      printf
              add     x1, sp, x             // address for input
              adr     x0, input_format      // scanf format string
              bl      scanf

              adr     x0, prompt            // prompt user
              bl      printf
              add     x1, sp, y             // address for input
              adr     x0, input_format      // scanf format string
              bl      scanf

              ldr     w0, [sp, x]           // get x
              ldr     w1, [sp, y]           // and y
              add     w3, w0, w1            // add them
              str     w3, [sp, sum]         // sum = x + y

              ldr     w0, [sp, x]           // get x
              ldr     w1, [sp, y]           // and y
              sub     w3, w0, w1            // subtract them
              str     w3, [sp, diff]        // diff = x - y

              ldr     w2, [sp, diff]        // sum
              ldr     w1, [sp, sum]         // difference
              adr     x0, result            // address of format string
              bl      printf

              mov     w0, wzr
              ldp     fp, lr, [sp], FRAME   // Delete stack frame
              ret
      ```
    * twelve.h
      ```c
      // Return 12.

      #ifndef TWELVE_H
      #define TWELVE_H
      int twelve(void);
      #endif
        ```
    * twelve.s
      ```asm
      // Return 12.

              .arch   armv8-a
              .text
              .align  2
              .global twelve
              .type   twelve, %function
      twelve:
              mov     w0, 12
              ret
        ```
    * thirty_four.h
      ```c
      // Return 34.

      #ifndef THIRTY_FOUR_H
      #define THIRTY_FOUR_H
      int thirty_four(void);
      #endif
        ```
    * thirty_four.s
      ```asm
      // Return 34.

              .arch   armv8-a
              .text
              .align  2
              .global thirty_four
              .type   thirty_four, %function
      thirty_four:
              mov     w0, 34
              ret
      ```
    * fifty_six.h
      ```c
      // Return 56.

      #ifndef FIFTY_SIX_H
      #define FIFTY_SIX_H
      int fifty_six(void);
      #endif
        ```
    * fifty_six.s
      ```asm
      // Return 56.

              .arch   armv8-a
              .text
              .align  2
              .global fifty_six
              .type   fifty_six, %function
      fifty_six:
              mov     w0, 56
              ret
      ```
3.  Return three characters.
    * test_chars.c
      ```c
      // Test three functions that return chars.

      #include <stdio.h>
      #include "exclaim.h"
      #include "upper_oh.h"
      #include "tilde.h"

      int main(void)
      {
          unsigned char return1, return2, return3;

          return1 = exclaim();
          return2 = upper_oh();
          return3 = tilde();
          printf("The returned chars are: %c, %c, and %c.\n",
                return1, return2, return3);

          return 0;
      }
      ```
    * exclaim.h
      ```c
      // Return '!'.

      #ifndef EXCLAIM_H
      #define EXCLAIM_H
      char exclaim(void);
      #endif
      ```
    * exclaim.s
      ```asm
      // Return '!'.

              .arch   armv8-a
              .text
              .align  2
              .global exclaim
              .type   exclaim, %function
      exclaim:
              mov     w0, '!'
              ret
      ```
    * upper_oh.h
      ```c
      // Return 'O'.

      #ifndef UPPER_OH_H
      #define UPPER_OH_H
      unsigned char upper_oh(void);
      #endif
      ```
    * upper_oh.s
      ```asm
      // Return 'O'.

              .arch   armv8-a
              .text
              .align  2
              .global upper_oh
              .type   upper_oh, %function
      upper_oh:
              mov     w0, 'O'
              ret
      ```
    * tilde.h
      ```c
      // Return '~'.

      #ifndef TILDE_H
      #define TILDE_H
      unsigned char tilde(void);
      #endif
      ```
    * tilde.s
      ```asm
      // Return '~'.

              .arch   armv8-a
              .text
              .align  2
              .global tilde
              .type   tilde, %function
      tilde:
              mov     w0, '~'
              ret
      ```
