// Clears GPIO pin. Assumes that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of GPIO in mapped memory
//       w1 <- pin number

// Constants
        .equ    GPCLR0, 0x28      // GPCLR registers offset

// Code
        .text
        .align  2
        .global gpio_pin_clr
        .type   gpio_pin_clr, %function
gpio_pin_clr:
        add     x0, x0, GPCLR0  // address of GPCLR0 register
        mov     w2, 1           // need a 1
        lsl     w2, w2, w1      // move to specified bit position
        ldr     w3, [x0]        // load entire register
        orr     w3, w3, w2      // set the bit
        str     w3, [x0]        // update register
        
        ret
