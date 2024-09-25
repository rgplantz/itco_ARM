// Show difference between two integers, return difference.
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
minus:
        .string " - "
equals:
        .string " = "
        .text
        .align  2
        .global difference
        .type   difference, %function
difference:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Our frame pointer
        stp     x19, x20, [sp, save1920]  // Save registers

        mov     w19, w0               // Save inputs
        mov     w20, w1

        mov     w0, w19               // First integer
        bl      put_int
        adr     x0, minus             // -
        bl      write_str
        mov     w0, w20               // Second integer
        bl      put_int
        adr     x0, equals            // =
        bl      write_str
        sub     w0, w19, w20          // difference
        bl      put_int
        mov     x0, '\n'
        bl      write_char

        sub     w0, w19, w20          // Return difference
        ldp     x19, x20, [sp, save1920]  // Restore registers
        ldp     x29, x30, [sp], FRAME // Delete stack frame
        ret
