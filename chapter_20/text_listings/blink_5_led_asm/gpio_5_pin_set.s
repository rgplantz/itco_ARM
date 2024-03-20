// Sets GPIO pin. Assumes that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of RIOBase in mapped memory
//       w1 <- pin number

// Constants
        .equ    RIO_SET, 0x2000     // set register

// Code
        .text
        .align  2
        .global gpio_pin_set
        .type   gpio_pin_set, %function
gpio_pin_set:
        mov     w2, 1               // a bit
        lsl     w2, w2, w1          // shift to pin location
        add     x0, x0, RIO_SET     // address RIO set reg
        str     w2, [x0]            // pin high
        ret
