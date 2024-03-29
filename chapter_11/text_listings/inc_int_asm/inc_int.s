// Increments an integer.
        .arch armv8-a
// Stack frame
        .equ    x, 28
        .equ    FRAME, 32
// Constants 
        .section  .rodata
prompt:
        .string "Enter an integer: "
input_format:
        .string "%i"
result:
        .string "Result: %i\n"
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, FRAME]!  // our stack frame
        mov     fp, sp

        adr     x0, prompt            // prompt user
        bl      printf
        add     x1, sp, x             // address for input
        adr     x0, input_format      // scanf format string
        bl      scanf

        ldr     w0, [sp, x]           // get x
        add     w1, w0, 1             // add one
        str     w1, [sp, x]           // x++;

        adr     x0, result            // address of format string
        bl      printf

        mov     w0, wzr
        ldp     fp, lr, [sp], FRAME   // undo stack frame
        ret
