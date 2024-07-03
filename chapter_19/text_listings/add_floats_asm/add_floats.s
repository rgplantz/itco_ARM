// Add two floats.
        .arch armv8-a
// Stack frame
        .equ    x, 16
        .equ    y, 20
        .equ    FRAME, 32
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
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, FRAME]!  // Create stack frame
        mov     fp, sp

        adr     x0, prompt_format     // Ask for number
        bl      printf
        add     x1, sp, x             // Place for first number
        adr     x0, get_format        // Get it
        bl      scanf
        adr     x0, prompt_format     // Ask for number
        bl      printf
        add     x1, sp, y             // Place for second number
        adr     x0, get_format        // Get it
        bl      scanf

        ldr     s0, [sp, x]           // Load x
        ldr     s1, [sp, y]           //   and y
        fadd    s2, s0, s1            // Sum
        fcvt    d0, s0                // Doubles for printf
        fcvt    d1, s1
        fcvt    d2, s2
        adr     x0, sum_format        // Formatting for printf
        bl      printf

        mov     w0, wzr               // Return 0
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret
