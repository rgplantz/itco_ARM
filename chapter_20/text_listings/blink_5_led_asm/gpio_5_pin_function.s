// Makes a GPIO pin an output. Assumes that GPIO registers
// have been mapped to application memory.
// Calling sequence:
//      x0 <- address of GPIO in mapped memory
//      w1 <- GPIO pin number
//      Returns address of RIOBase

// Constants
        .equ    RIOBase, 0x10000  // offset to RIO
        .equ    PADBase, 0x20000  // offset to
        .equ    PIN_FUNCTION, 5   // SYS_RIO
        .equ    PAD_AMPS, 0x10    // 4 ma
        .equ    RIO_SET, 0x2000   // set reg. offset
        .equ    RIO_OE, 0x04      // output enable

// Code
        .text
        .align  2
        .global gpio_pin_to_output
        .type   gpio_pin_to_output, %function
gpio_pin_to_output:
        mov     w3, w1            // pin number
        add	    x2, x0, PADBase   // x2 = PADBase
        add	    x2, x2, 4         // x2 = pad

        lsl	    x4, x3, 3         // 8 x pin number
        add	    x5, x0, x4        // GPIO_pin_number_CTRL
        mov	    w6, PIN_FUNCTION  // system registered i/o
        str	    w6, [x5, 4]       // GPIO_pin_number_STATUS = fn;

        lsl	    x4, x3, 2         // 4 x pin number
        add	    x5, x2, x4        // pin_number pad reg. address 
        mov	    w6, PAD_AMPS      // 4 ma
        str	    w6, [x5]          // set pad amps

        add	    x0, x0, RIOBase   // x1 = RIOBase
        mov	    w2, 1             // a bit
        lsl	    w2, w2, w1        // shift to pin location
        add	    x3, x0, RIO_SET   // use RIO set register
        str	    w2, [x3, RIO_OE]  // make pin an output

        ret
