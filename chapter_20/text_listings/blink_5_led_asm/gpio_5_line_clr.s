// Clears GPIO line. Assumes that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of RIOBase in mapped memory
//       w1 <- line number

// Constants
        .equ    RIO_CLR, 0x3000     // clear reg

// Code
        .text
        .align  2
        .global gpio_line_clr
        .type   gpio_line_clr, %function
gpio_line_clr:
        mov     w2, 1               // a bit
        lsl     w2, w2, w1          // shift to line location
        add     x0, x0, RIO_CLR     // address RIO clear reg
        str     w2, [x0]            // line low
        ret
