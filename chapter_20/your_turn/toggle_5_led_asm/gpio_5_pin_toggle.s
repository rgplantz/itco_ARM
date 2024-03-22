// Toggles GPIO pin. Assumes that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of RIOBase in mapped memory
//       w1 <- pin number

// Constants
        .equ    RIO_XOR, 0x1000     // xor register

// Code
        .text
        .align  2
        .global gpio_pin_toggle
        .type   gpio_pin_toggle, %function
gpio_pin_toggle:
        mov     w2, 1               // a bit
        lsl     w2, w2, w1          // shift to pin location
        add     x0, x0, RIO_XOR     // address RIO xor reg
        str     w2, [x0]            // toggle pin
        ret
