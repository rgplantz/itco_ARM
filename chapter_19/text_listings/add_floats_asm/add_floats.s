// Adds two floats
        .arch armv8-a
// Stack frame
        .equ    x, 16
        .equ    y, 20
        .equ    frame, 32
// Constant data
        .section  .rodata
        .align  3
prompt_format:
        .string "Enter number: "
get_format:
        .string "%f"
sum_format:
        .string "%f + %f = %f\n"
// Code
        .text
        .align	2
        .global	main
        .type	main, %function
main:
        stp     fp, lr, [sp, frame]!  // our stack frame
        mov     fp, sp

        adr     x0, prompt_format     // ask for number
        bl      printf
        add     x1, sp, x             // place for first number
        adr     x0, get_format        // get it
        bl      scanf
        adr     x0, prompt_format     // ask for number
        bl      printf
        add     x1, sp, y             // place for second number
        adr     x0, get_format        // get it
        bl      scanf

        ldr     s0, [sp, x]           // load x
        ldr     s1, [sp, y]           //    and y
        fcvt    d0, s0                // doubles needed for printf
        fcvt    d1, s1
        fadd    d2, d0, d1            // sum
        adr     x0, sum_format        // formatting for printf
        bl      printf

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp], frame   // undo stack frame
        ret
