// factorial.s
// Computes n!
// Calling sequence:
//    w0 <- n
//    returns n!
        .arch armv8-a
// Stack frame
        .equ    n, 16
        .equ    frame, 32
// Code
        .text
        .align  2
        .global factorial
        .type   factorial, %function
factorial:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        str     w0, [sp, n]           // save n
        mov     w0, 1                 // assume base case, 0! = 1
        ldr     w1, [sp, n]           // get n
        cbz     w1, baseCase          // check for base case
        sub     w0, w1, 1             // no,
        bl      factorial             //    compute (n - 1)!
        ldr     w1, [sp, n]           // get n
        mul     w0, w0, w1            // n x (n - 1)!
baseCase:
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
