// Returns 56

        .arch   armv8-a
        .text
        .align  2
        .global fifty_six
        .type   fifty_six, %function
fifty_six:
        mov     w0, 56
        ret
