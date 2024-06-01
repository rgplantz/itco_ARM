// Increment an integer.
        .arch armv8-a
// Stack frame
        .equ    x, 28
        .equ    FRAME, 32
// Constants 
        .section .rodata
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
        stp     fp, lr, [sp, FRAME]!  // Our stack frame
        mov     fp, sp

        adr     x0, prompt            // Prompt user.
        bl      printf
        add     x1, sp, x             // Address for input
        adr     x0, input_format      // scanf format string
        bl      scanf

        ldr     w0, [sp, x]           // Get x.
        add     w1, w0, 1             // Add 1.
        str     w1, [sp, x]           // x++;

        adr     x0, result            // printf format string
        bl      printf                // Result is in w1

        mov     w0, wzr
        ldp     fp, lr, [sp], FRAME   // Undo stack frame.
        ret
