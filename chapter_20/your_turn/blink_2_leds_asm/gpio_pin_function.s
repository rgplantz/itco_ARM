// Selects a function for a GPIO pin. Assumes that GPIO registers
// have been mapped to application memory.
// Calling sequence:
//      x0 <- address of GPIO in mapped memory
//      w1 <- GPIO pin number
//      w2 <- pin function

// Constants for assembler
        .equ    FIELD_MASK, 0b111  // 3 bits

// Code
        .text
        .align  2
        .global gpio_pin_function
        .type   gpio_pin_function, %function
gpio_pin_function:
// Determine register and location of pin function field
        mov     w3, 10          // ten fields per GPFSEL register
        udiv    w4, w1, w3      // w4 = GPFSEL register number
        msub    w5, w4, w3, w1  // pin field number in register
// Compute address of GPFSEL register and pin field in register     
        lsl     w4, w4, 2       // w4 = offset to GPSEL register
        add     x0, x0, x4      // GPFSELn memory address
        ldr     w4, [x0]        // w4 = GPFSELn register contents

        add     w5, w5, w5, lsl 1   // 3 X pin field number
        mov     w6, FIELD_MASK  // gpio pin field
        lsl     w6, w6, w5      // shift to field bit position
        bic     w4, w4, w6      // clear current pin field

        lsl     w2, w2, w5      // shift function code to pin position
        orr     w4, w4, w2      // insert function code
        str     w4, [x0]        // update register

        ret
