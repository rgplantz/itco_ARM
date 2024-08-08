// Returns upper_oh

        .arch   armv8-a
        .text
        .align  2
        .global upper_oh
        .type   upper_oh, %function
upper_oh:
        mov     w0, 'O'
        ret
