// Adds two integers and outputs sum.
// Calling sequence:
//    w0 <- integer
//    w1 <- integer
//    x2 <- address of output
//    returns 0
        .arch armv8-a
// Stack frame
        .equ    frame, 16
// Code
        .text
        .align  2
        .global addTwo
        .type   addTwo, %function
addTwo:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        add     w0, w0, w1            // compute sum
        str     w0, [x2]              // output sum

        mov     w0, wzr               // return 0
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
