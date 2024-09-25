// Add, subtract, multiply, and divide two integers.
        .arch armv8-a
// Stack frame
        .equ    x, 16
        .equ    y, 20
        .equ    FRAME, 32
// Code
        .text
        .section  .rodata
        .align  3
prompt:
        .string "Enter an integer: "
plus:
        .string " + "
minus:
        .string " - "
times:
        .string " * "
div:
        .string " / "
remainder:
        .string " % "
equals:
        .string " = "
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Our frame pointer

        adr     x0, prompt            // Ask user for input
        bl      write_str
        bl      get_int               // Get x
        str     w0, [sp, x]
        adr     x0, prompt            // Ask user for input
        bl      write_str
        bl      get_int               // Get y
        str     w0, [sp, y]

        ldr     w0, [sp, x]           // Load x
        ldr     w1, [sp, y]           //    and y
        bl      sum

        ldr     w0, [sp, x]           // Load x
        ldr     w1, [sp, y]           //    and y
        bl      difference

        ldr     w0, [sp, x]           // Load x
        ldr     w1, [sp, y]           //    and y
        bl      product

        ldr     w0, [sp, x]           // Load x
        ldr     w1, [sp, y]           //    and y
        bl      quotient

        ldr     w0, [sp, x]           // Load x
        ldr     w1, [sp, y]           //    and y
//        bl      remainder

        mov     w0, wzr               // Return 0
        ldp     x29, x30, [sp], FRAME // Delete stack frame
        ret
