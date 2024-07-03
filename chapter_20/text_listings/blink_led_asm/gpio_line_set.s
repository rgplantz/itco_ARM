// Set a GPIO line. Assume that GPIO registers
// have been mapped to application memory.
// Calling sequence:
//       x0 <- address of GPIO in mapped memory
//       w1 <- line number

// Constants
        .equ    GPSET0, 0x1c     // GPSET register offset

// Code
        .text
        .align  2
        .global gpio_line_set
        .type   gpio_line_set, %function
gpio_line_set:
        add     x0, x0, GPSET0  // Address of GPSET0 register
        mov     w2, 1           // Need a 1
        lsl     2, w2, w1       // Move to specified bit position
        str     w2, [x0]        // Output
        
        ret
