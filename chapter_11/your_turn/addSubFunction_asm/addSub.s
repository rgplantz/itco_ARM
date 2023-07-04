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

        add     x3, sp, diff              // place for difference
        add     x2, sp, sum               // place for sum
        ldr     x1, [sp, y]               // y
        ldr     x0, [sp, x]               // x
        bl      sumDiff                   // do arithmetic

        ldr     w2, [sp, diff]            // difference
        ldr     w1, [sp, sum]             // sum
        adr     x0, result                // address of format string
        bl      printf

        mov     w0, wzr
        ldp     fp, lr, [sp], frameSize   // undo stack frame
        ret
