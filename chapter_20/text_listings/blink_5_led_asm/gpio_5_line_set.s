// Sets GPIO line. Assumes that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of RIOBase in mapped memory
//       w1 <- line number

// Constants
        .equ    RIO_SET, 0x2000     // set reg

// Code
        .text
        .align  2
        .global gpio_5_line_set
        .type   gpio_5_line_set, %function
gpio_5_line_set:
        mov     w2, 1               // a bit
        lsl     w2, w2, w1          // shift to line location
        add     x0, x0, RIO_SET     // address RIO set reg
        str     w2, [x0]            // line low
        ret
