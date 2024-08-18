// Return '~'.

        .arch   armv8-a
        .text
        .align  2
        .global tilde
        .type   tilde, %function
tilde:
        mov     w0, '~'
        ret
