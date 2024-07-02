// Compute n factorial.
// Calling sequence:
//    w0 <- n
//    Returns n!
        .arch armv8-a
// Stack frame
        .equ    n, 16
        .equ    FRAME, 32
// Code
        .text
        .align  2
        .global factorial
        .type   factorial, %function
factorial:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer

        str     w0, [sp, n]           // Save n
        mov     w1, w0                //   and make a copy
        mov     w0, 1                 // Assume base case, 0! = 1
        cbz     w1, base_case         // Check for base case
        sub     w0, w1, 1             // No,
        bl      factorial             //   compute (n - 1)!
        ldr     w1, [sp, n]           // Get n
        mul     w0, w0, w1            // n * (n - 1)!
base_case:
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret                           // Back to caller
