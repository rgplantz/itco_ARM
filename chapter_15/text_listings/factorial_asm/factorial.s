// factorial.s
// Computes n!
// Calling sequence:
//    w0 <- n
//    returns n!
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
        stp     fp, lr, [sp, -FRAME]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        str     w0, [sp, n]           // save n
        mov     w1, w0                // and make a copy
        mov     w0, 1                 // assume base case, 0! = 1
        cbz     w1, base_case         // check for base case
        sub     w0, w1, 1             // no,
        bl      factorial             //    compute (n - 1)!
        ldr     w1, [sp, n]           // get n
        mul     w0, w0, w1            // n x (n - 1)!
base_case:
        ldp     fp, lr, [sp], FRAME   // restore fp, lr, sp
        ret                           // back to caller
