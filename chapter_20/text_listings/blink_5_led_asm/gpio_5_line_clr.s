// Clear a GPIO line. Assume that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of RIOBase in mapped memory
//       w1 <- line number

// Constants
        .equ    RIO_CLR, 0x3000     // Clear reg

// Code
        .text
        .align  2
        .global gpio_5_line_clr
        .type   gpio_5_line_clr, %function
gpio_5_line_clr:
        mov     w2, 1               // A bit
        lsl     w2, w2, w1          // Shift to line location
        add     x0, x0, RIO_CLR     // Address of RIO clear reg
        str     w2, [x0]            // Line low
        ret
