// addTwo.s
// Adds two integers and outputs sum.
// Calling sequence:
//    w0 <- integer
//    w1 <- integer
//    x2 <- address of output
//    returns 0
        .arch armv8-a
// Stack frame
        .equ    saveRegs, 16
        .equ    frame,32
// Code
        .text
        .align  2
        .global addTwo
        .type   addTwo, %function
addTwo:
        stp     fp, lr, [sp, -frame]!     // create our stack frame
        mov     fp, sp                    // set our frame pointer
        stp     x19, x20, [sp, saveRegs]  // save for local vars

        mov     x20, x2                   // for output
        add     w19, w0, w1               // compute sum
        str     w19, [x20]                // output sum

        mov     w0, wzr                   // return 0
        ldp     x19, x20, [sp, saveRegs]  // restore reg.
        ldp     fp, lr, [sp], frame       // restore fp, lr, sp
        ret                               // back to caller
