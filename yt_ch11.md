---
layout: default
title: Chapter 11
---

## Chapter 11

1.  The `diff` command shows that optimizing for speed (`-Ofast`) causes the compiler to align the constant data on address boundaries such that data loads faster when the program is executed.
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
    Both optimizations (`-Ofast` and `-Os`) use a faster algorithm to add 1 to the integer. With no optimization the addition is performed in `w0` and then moved to `w1` for the call to `printf`:
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
    The optimizations load the integer directly into `w1` and perform the addition there:
    ```
    ldr	    w1, [sp, 28]
    adrp	  x0, .LC2
    add	    x0, x0, :lo12:.LC2
    add	    w1, w1, 1
    str	    w1, [sp, 28]
    bl	    printf
    ```
2.  add_sub.s
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
1.  Return three characters.
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
