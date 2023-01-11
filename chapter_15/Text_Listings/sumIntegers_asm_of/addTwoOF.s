// addTwoOF.s
// Adds two integers outputs  sum; returns overflow T or F
// Calling sequence:
//    w0 <- integer a
//    w0 <- integer b
//    x2 <- address for ouput
//    returns 1 for overflow, 0 for no overflow
        .arch armv8-a
// Code
        .text
        .align  2
        .global addTwo
        .type   addTwo, %function
addTwo:
        adds    w1, w0, w1            // add, set condition flags
        cinc    w0, wzr, vs           // overflow flag
        str     w1, [x2]              // store output
        ret                           // back to caller
