// Show remainder from dividing two integers, return remainder.
// Calling sequence
//    w0 <- first integer
//    w1 <- second integer
        .arch armv8-a
// Stack frame
        .equ    save1920, 16
        .equ    FRAME, 32
// Code
        .text
        .section  .rodata
        .align  3
rem:
        .string " % "
equals:
        .string " = "
        .text
        .align  2
        .global remainder
        .type   remainder, %function
remainder:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Our frame pointer
        stp     x19, x20, [sp, save1920]  // Save registers

        mov     w19, w0               // Save inputs
        mov     w20, w1

        mov     w0, w19               // First integer
        bl      put_int
        adr     x0, rem               // %
        bl      write_str
        mov     w0, w20               // Second integer
        bl      put_int
        adr     x0, equals            // =
        bl      write_str
        sdiv    w1, w19, w20          // Quotient
        msub    w19, w1, w20, w19     // Save remainder
        mov     w0, w19               // For put_int
        bl      put_int
        mov     x0, '\n'
        bl      write_char

        mov     w0, w19               // Return remainder
        ldp     x19, x20, [sp, save1920]  // Restore registers
        ldp     x29, x30, [sp], FRAME // Delete stack frame
        ret
