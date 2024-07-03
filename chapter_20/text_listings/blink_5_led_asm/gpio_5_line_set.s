// Set GPIO line. Assume that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of RIOBase in mapped memory
//       w1 <- line number

// Constants
        .equ    RIO_SET, 0x2000     // Set reg

// Code
        .text
        .align  2
        .global gpio_5_line_set
        .type   gpio_5_line_set, %function
gpio_5_line_set:
        mov     w2, 1               // A bit
        lsl     w2, w2, w1          // Shift to line location
        add     x0, x0, RIO_SET     // Address of RIO set reg
        str     w2, [x0]            // Line low
        ret
