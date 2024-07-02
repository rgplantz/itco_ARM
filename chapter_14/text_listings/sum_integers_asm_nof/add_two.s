// Add two integers and output the sum.
// Calling sequence:
//    x0 <- address of output
//    w1 <- integer
//    w2 <- integer
//    Returns 0
        .arch armv8-a
// Stack frame
        .equ    save1920, 16
        .equ    FRAME, 32
// Code
        .text
        .align  2
        .global add_two
        .type   add_two, %function
add_two:
        stp     fp, lr, [sp, -FRAME]!     // Create stack frame
        mov     fp, sp                    // Set our frame pointer
        stp     x19, x20, [sp, save1920]  // Save for local vars

        mov     x20, x0                   // For output
        add     w19, w2, w1               // Compute sum
        str     w19, [x20]                // Output sum

        mov     w0, wzr                   // Return 0
        ldp     x19, x20, [sp, save1920]  // Restore reg
        ldp     fp, lr, [sp], FRAME       // Delete stack frame
        ret                               // Back to caller
