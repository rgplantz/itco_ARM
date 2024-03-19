// Clears GPIO pin. Assumes that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of RIOBase in mapped memory
//       w1 <- pin number

// Constants
        .equ    RIO_CLR, 0x3000     // 0th CRTL reg

// Code
        .text
        .align  2
        .global gpio_pin_clr
        .type   gpio_pin_clr, %function
gpio_pin_clr:
        mov     w2, 1               // a bit
        lsl     w2, w2, w1          // shift to pin location
        add     x0, x0, RIO_CLR     // address RIO clear reg
        str     w2, [x0]            // output
        ret
