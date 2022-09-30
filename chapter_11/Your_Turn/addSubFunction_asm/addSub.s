// addSub.s
// Adds and subtracts two integers.
        .arch armv8-a
// Stack frame
        .equ    x, 16
        .equ    y, 20
        .equ    sum, 24
        .equ    diff, 28
        .equ    frameSize, 32
// Constants 
        .section        .rodata
prompt:
        .string "Enter an integer: "
inputFormat:
        .string "%i"
result:
        .string "Sum = %i, Difference = %i\n"
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, frameSize]!  // our stack frame
        mov     fp, sp

        adr     x0, prompt                // prompt user
        bl      printf
        add     x1, sp, x                 // address for input
        adr     x0, inputFormat           // scanf format string
        bl      scanf

        adr     x0, prompt                // prompt user
        bl      printf
        add     x1, sp, y                 // address for input
        adr     x0, inputFormat           // scanf format string
        bl      scanf

        ldr     w0, [sp, x]               // get x
        ldr     w1, [sp, y]               // and y
        add     w3, w0, w1                // add them
        str     w3, [sp, sum]             // sum = x + y

        ldr     w0, [sp, x]               // get x
        ldr     w1, [sp, y]               // and y
        sub     w3, w0, w1                // subtract them
        str     w3, [sp, diff]            // diff = x - y

        ldr     w2, [sp, sum]             // sum
        ldr     w1, [sp, sum]             // difference
        adr     x0, result                // address of format string
        bl      printf

        mov     w0, wzr
        ldp     fp, lr, [sp], frameSize   // undo stack frame
        ret
