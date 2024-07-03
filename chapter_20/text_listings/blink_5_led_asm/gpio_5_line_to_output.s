// Make a GPIO line an output. Assume that GPIO registers
// have been mapped to application memory.
// Calling sequence:
//      x0 <- address of GPIO in mapped memory
//      w1 <- GPIO line number
//      Return address of RIOBase.

// Constants
        .equ    RIOBase, 0x10000  // Offset to RIO registers
        .equ    PADBase, 0x20000  // Offset to PAD registers
        .equ    SYS_RIO, 5        // Use RIO to control GPIO
        .equ    PAD_AMPS, 0x10    // 4 mA
        .equ    RIO_SET, 0x2000   // Set reg offset
        .equ    RIO_OE, 0x04      // Output enable

// Code
        .text
        .align  2
        .global gpio_5_line_to_output
        .type   gpio_5_line_to_output, %function
gpio_5_line_to_output:
        lsl	    x2, x1, 3         // 8 x line number
        add	    x3, x0, x2        // GPIO_line_number_STATUS
        mov	    w2, SYS_RIO       // System registered I/O
        str	    w2, [x3, 4]       // GPIO_line_number_CTRL

        add	    x2, x0, PADBase
        add	    x2, x2, 4         // Skip over VOLTAGE_SELECT reg
        lsl	    x3, x1, 2         // 4 x line number
        add	    x3, x3, x2        // Pad reg address of line number
        mov	    w4, PAD_AMPS      // 4 mA
        str	    w4, [x3]          // Set pad amps

        add	    x0, x0, RIOBase
        mov	    w2, 1             // A bit
        lsl	    w2, w2, w1        // Shift to line location
        add	    x3, x0, RIO_SET   // Use RIO set register
        str	    w2, [x3, RIO_OE]  // Make line an output

        ret
