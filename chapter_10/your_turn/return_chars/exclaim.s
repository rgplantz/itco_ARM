// Return '!'.

        .arch   armv8-a
        .text
        .align  2
        .global exclaim
        .type   exclaim, %function
exclaim:
        mov     w0, '!'
        ret
