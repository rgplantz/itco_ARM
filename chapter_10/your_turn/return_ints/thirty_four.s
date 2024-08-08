// Returns 34

        .arch   armv8-a
        .text
        .align  2
        .global thirty_four
        .type   thirty_four, %function
thirty_four:
        mov     w0, 34
        ret
