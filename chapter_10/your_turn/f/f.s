// Minimum components of a C function, in assembly language
// returns 0

        .arch   armv8-a
        .text
        .align  2
        .global f
        .type   f, %function
f:
        mov     w0, wzr         // return 0;
        ret
