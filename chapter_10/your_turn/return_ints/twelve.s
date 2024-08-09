// Return 12.

        .arch   armv8-a
        .text
        .align  2
        .global twelve
        .type   twelve, %function
twelve:
        mov     w0, 12
        ret
