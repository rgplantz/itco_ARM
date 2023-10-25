// Adds two integers outputs  sum; returns overflow T or F
// Calling sequence:
//    x0 <- address a, for output
//    w1 <- integer b
//    w2 <- integer c
//    returns 1 for overflow, 0 for no overflow
        .arch armv8-a
// Code
        .text
        .align  2
        .global add_two
        .type   add_two, %function
add_two:
        adds    w1, w1, w2    // add, set condition flags
        str     w1, [x0]      // store output
        cinc    w0, wzr, vs   // return overflow flag
        ret                   // back to caller
