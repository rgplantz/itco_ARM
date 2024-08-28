---
layout: default
title: Chapter 12
---

## Chapter 12

1.  `adr` instruction.
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
3.  add_sub.s
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
            .section  .rodata
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

            adr     x0, prompt            // Prompt user
            bl      printf
            add     x1, sp, x             // Address for input
            adr     x0, input_format      // scanf format string
            bl      scanf

            adr     x0, prompt            // Prompt user
            bl      printf
            add     x1, sp, y             // Address for input
            adr     x0, input_format      // scanf format string
            bl      scanf

            add     x3, sp, diff          // Place for difference
            add     x2, sp, sum           // Place for sum
            ldr     x1, [sp, y]           // y
            ldr     x0, [sp, x]           // x
            bl      sum_diff              // Do arithmetic

            ldr     w2, [sp, diff]        // Difference
            ldr     w1, [sp, sum]         // Sum
            adr     x0, result            // Address of format string
            bl      printf

            mov     w0, wzr
            ldp     fp, lr, [sp], FRAME   // Delete stack frame
            ret
    ```