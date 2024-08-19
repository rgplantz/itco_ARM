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
