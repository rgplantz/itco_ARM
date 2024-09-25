// Show product of two integers, return product.
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
plus:
        .string " * "
equals:
        .string " = "
        .text
        .align  2
        .global product
        .type   product, %function
product:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Our frame pointer
        stp     x19, x20, [sp, save1920]  // Save registers

        mov     w19, w0               // Save inputs
        mov     w20, w1

        mov     w0, w19               // First integer
        bl      put_int
        adr     x0, plus              // +
        bl      write_char
        mov     w0, w20               // Second integer
        bl      put_int
        adr     x0, equals            // =
        bl      write_str
        mul     w0, w19, w20          // product
        bl      put_int
        mov     x0, '\n'
        bl      write_char

        mul     w0, w19, w20          // Return product
        ldp     x19, x20, [sp, save1920]  // Restore registers
        ldp     x29, x30, [sp], FRAME // Delete stack frame
        ret
