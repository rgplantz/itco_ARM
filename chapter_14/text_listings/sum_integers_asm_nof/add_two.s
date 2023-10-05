// Adds two integers and outputs sum.
// Calling sequence:
//    w0 <- integer
//    w1 <- integer
//    x2 <- address of output
//    returns 0
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
        stp     fp, lr, [sp, -FRAME]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        stp     x19, x20, [sp, save1920]  // save for local vars

        mov     x20, x2               // for output
        add     w19, w0, w1           // compute sum
        str     w19, [x20]            // output sum

        mov     w0, wzr               // return 0
        ldp     x19, x20, [sp, save1920]  // restore regs
        ldp     fp, lr, [sp], FRAME   // restore fp, lr, sp
        ret                           // back to caller
