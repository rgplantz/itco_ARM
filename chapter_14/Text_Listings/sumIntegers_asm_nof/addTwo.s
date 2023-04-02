// Adds two integers and outputs sum
// Calling sequence:
//    w0 <- integer
//    w1 <- integer
//    x2 <- address of output
//    returns 0
        .arch armv8-a
// Code
        .text
        .align  2
        .global addTwo
        .type   addTwo, %function
addTwo:
        add     w0, w0, w1            // sum them
        str     w0, [x2]              // output sum
        mov     w0, wzr               // return 0
        ret                           // back to caller
