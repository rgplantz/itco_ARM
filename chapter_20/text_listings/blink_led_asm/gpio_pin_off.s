// Outputs 0.0 volts to GPIO pin. Assumes that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of GPIO in mapped memory
//       w1 <- pin number

// Constants
        .equ    GPCLR0, 0x28      // GPCLR registers offset

// Code
        .text
        .align  2
        .global gpio_pin_low
        .type   gpio_pin_low, %function
gpio_pin_low:
        add     x0, x0, GPCLR0  // if w2 != 0, set pin
        cmp     w1, 32          // 32 bits in GPSETn register
        b.lo    zero_reg        // pin number in GPSET0 register
        sub     w1, w1, 32      // pin number in GPSET1 register
zero_reg:
        mov     w3, 1           // need a 1
        lsl     w3, w3, w1      // move to specified bit position
        ldr     w4, [x0]        // load entire register
        orr     w4, w4, w3      // set the bit
        str     w4, [x0]        // update register
        
        ret
