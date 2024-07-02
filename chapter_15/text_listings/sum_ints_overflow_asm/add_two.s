// Adds two integers outputs  sum; return overflow T or F.
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
        adds    w1, w1, w2    // Add and set condition flags
        str     w1, [x0]      // Store output
        cinc    w0, wzr, vs   // Overflow flag
        ret                   // Back to caller
