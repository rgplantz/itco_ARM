// factorial.s
// Computes n!
// Calling sequence:
//    w0 <- n
//    returns n!
        .arch armv8-a
// Stack frame
        .equ    saveReg, 16
        .equ    frame, 32
// Code
        .text
        .align  2
        .global factorial
        .type   factorial, %function
factorial:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        str     w19, [sp, saveReg]    // save, use for n

        mov     w19, w0               // copy n
        mov     w0, 1                 // assume base case, 0! = 1
        cbz     w19, baseCase         // check for base case
        sub     w0, w19, 1            // no, n - 1
        bl      factorial             // compute (n - 1)!
        mul     w0, w0, w19           // n x (n - 1)!
baseCase:
        ldr     x19, [sp, saveReg]    // restore x19
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
