// Sets GPIO pin. Assumes that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of GPIO in mapped memory
//       w1 <- pin number

// Constants
        .equ    GPSET0, 0x1c      // register offset

// Code
        .text
        .align  2
        .global gpio_pin_set
        .type   gpio_pin_set, %function
gpio_pin_set:
        add     x0, x0, GPSET0  // address of GPSET0 register
        mov     w3, 1           // need a 1
        lsl     w3, w3, w1      // move to specified bit position
        ldr     w4, [x0]        // load entire register
        orr     w4, w4, w3      // set the bit
        str     w4, [x0]        // update register
        
        ret
