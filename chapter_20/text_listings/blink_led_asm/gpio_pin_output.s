// Outputs 3.5 or 0.0 volts to GPIO pin. Assumes that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of GPIO in mapped memory
//       w1 <- pin number
//       w2 <- 1 for 3.5V, 0 for 0.0V

// Constants
        .equ    GPSET0, 0x1c      // GPSET registers offset
        .equ    GPCLR0, 0x28      // GPCLR registers offset

// Code
        .text
        .align  2
        .global gpio_pin_output
        .type   gpio_pin_output, %function
gpio_pin_output:
        cbz     w2, clear_pin   // if w2 = 0, clear pin
        add     x0, x0, GPSET0  // if w2 != 0, set pin
        b       zero_one        // determine if 0 or 1 register
clear_pin:
        add     x0, x0, GPCLR0  // assume clear pin
zero_one:
        cmp     w1, 32          // 32 bits in GP***n register
        b.lo    zero_reg        // pin number in GP***0 register
        sub     w1, w1, 32      // pin number in GP***1 register
zero_reg:
        mov     w3, 1           // need a 1
        lsl     w3, w3, w1      // move to specified bit position
        ldr     w4, [x0]        // load entire register
        orr     w4, w4, w3      // set the bit
        str     w4, [x0]        // update register
        
        ret
