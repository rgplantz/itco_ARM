// Makes a GPIO line an output. Assumes that GPIO registers
// have been mapped to application memory.
// Calling sequence:
//      x0 <- address of GPIO in mapped memory
//      w1 <- GPIO line number
//      Returns address of RIOBase

// Constants
        .equ    RIOBase, 0x10000  // offset to RIO registers
        .equ    PADBase, 0x20000  // offset to PAD registers
        .equ    SYS_RIO, 5        // use RIO to control GPIO
        .equ    PAD_AMPS, 0x10    // 4 ma
        .equ    RIO_SET, 0x2000   // set reg. offset
        .equ    RIO_OE, 0x04      // output enable

// Code
        .text
        .align  2
        .global gpio_5_line_to_output
        .type   gpio_5_line_to_output, %function
gpio_5_line_to_output:
        lsl	    x2, x1, 3         // 8 x line number
        add	    x3, x0, x2        // GPIO_line_number_CTRL
        mov	    w2, SYS_RIO       // system registered i/o
        str	    w2, [x3, 4]       // GPIO_line_number_STATUS = fn;

        add	    x2, x0, PADBase
        add	    x2, x2, 4         // skip over VOLTAGE_SELECT reg.
        lsl	    x3, x1, 2         // 4 x line number
        add	    x3, x3, x2        // pad reg. address of line number
        mov	    w4, PAD_AMPS      // 4 ma
        str	    w4, [x3]          // set pad amps

        add	    x0, x0, RIOBase
        mov	    w2, 1             // a bit
        lsl	    w2, w2, w1        // shift to line location
        add	    x3, x0, RIO_SET   // use RIO set register
        str	    w2, [x3, RIO_OE]  // make line an output

        ret
