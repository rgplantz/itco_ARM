// Make a GPIO line an output. Assume that GPIO registers
// have been mapped to application memory.
// Calling sequence:
//      x0 <- address of GPIO in mapped memory
//      w1 <- GPIO line number
//      Return address of GPIO.

// Useful constants
        .equ    FIELD_MASK, 0b111  // 3 bits
        .equ    OUTPUT, 1          // Use line for output

// Code
        .text
        .align  2
        .global gpio_line_to_output
        .type   gpio_line_to_output, %function
gpio_line_to_output:
// Determine register and location of line function field
        mov     w3, 10              // 10 fields per GPFSEL register
        udiv    w4, w1, w3          // GPFSEL register number
        msub    w5, w4, w3, w1      // Relative FSEL number in register
// Compute address of GPFSEL register and line field in register     
        lsl     w4, w4, 2           // Offset to GPFSEL register
        add     x7, x0, x4          // GPFSELn memory address
        ldr     w4, [x7]            // GPFSELn register contents

        add     w5, w5, w5, lsl 1   // 3 X relative FSEL number
        mov     w6, FIELD_MASK      // FSEL line field
        lsl     w6, w6, w5          // Shift to relative FSEL bit position
        bic     w4, w4, w6          // Clear current FSEL

        mov     w2, OUTPUT          // Function = output
        lsl     w2, w2, w5          // Shift function code to FSEL position
        orr     w4, w4, w2          // Insert function code
        str     w4, [x7]            // Update GPFSEL register

        ret
