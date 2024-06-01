// Minimum components of a C program, in assembly language

        .arch   armv8-a
        .text
        .align  2
        .global main
        .type   main, %function
main:
        mov     w0, wzr         // Return 0.
        ret
