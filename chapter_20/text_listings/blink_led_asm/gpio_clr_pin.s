// Clears a GPIO pin. Assumes that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of GPIO in mapped memory
//       w1 <- pin number

// Constants
        .equ    PINS_IN_REG, 32
        .equ    GPCLR0, 0x28      // GPCLR registers offset
        .equ    GPCLR0, 0x28      // GPCLR registers offset

// Code
        .text
        .align  2
        .global gpio_clear_pin
        .type   gpio_clear_pin, %function
gpio_clear_pin:
        mov     w2, PINS_IN_REG // number of pins in register
        udiv    w3, w1, w2      // GPCLR register number
        msub    w4, w3, w2, w1  // bit number in register

        add     x0, x0, GPCLR0  // address of GPSET regs.
        lsl     w3, w3, 2       // 4 bytes in a register
        add     x0, x0, x3      // address of GPSETn
        mov     w5, 1           // need a 1
        lsl     w5, w5, w4      // move to proper bit position
        ldr     w6, [x0]        // load entire register
        orr     w6, w6, w5      // set the clear bit
        str     w6, [X0]        // update register
        
        ret
