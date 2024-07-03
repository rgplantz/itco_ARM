// Clear GPIO line. Assume that GPIO registers
// have been mapped to application memory.
// Calling sequence:
//       x0 <- address of GPIO in mapped memory
//       w1 <- line number

// Constants
        .equ    GPCLR0, 0x28    // GPCLR register offset

// Code
        .text
        .align  2
        .global gpio_line_clr
        .type   gpio_line_clr, %function
gpio_line_clr:
        add     x0, x0, GPCLR0  // Address of GPCLR0 register
        mov     w2, 1           // Need a 1
        lsl     w2, w2, w1      // Move to specified bit position
        str     w2, [x0]        // Output
        
        ret
