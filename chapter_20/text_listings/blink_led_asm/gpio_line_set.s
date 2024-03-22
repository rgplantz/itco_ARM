// Sets GPIO line. Assumes that GPIO registers
// have been mapped to programming memory.
// Calling sequence:
//       x0 <- address of GPIO in mapped memory
//       w1 <- line number

// Constants
        .equ    GPSET0, 0x1c      // GPSET register offset

// Code
        .text
        .align  2
        .global gpio_line_set
        .type   gpio_line_set, %function
gpio_line_set:
        add     x0, x0, GPSET0  // address of GPSET0 register
        mov     w2, 1           // need a 1
        lsl     w2, w2, w1      // move to specified bit position
        str     w2, [x0]        // output
        
        ret
