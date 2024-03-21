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

        lsl	    x3, x1, 3         // 8 x pin number
        add	    x2, x0, x3        // GPIO_pin_number_CTRL
        mov	    w4, PIN_FUNCTION  // system registered i/o
        str	    w4, [x2, 4]       // GPIO_pin_number_STATUS = fn;

        add	    x2, x0, RIOBase   // x2 = PADBase
        add	    x2, x2, 4         // x2 = pad
        lsl	    x3, x1, 2         // 4 x pin number
        add	    x2, x2, x3        // pin_number pad reg. address 
        mov	    w4, PAD_AMPS      // 4 ma
        str	    w4, [x2]          // set pad amps

        add	    x0, x0, RIOBase   // x1 = RIOBase
        add	    x2, x0, RIO_SET   // use RIO set register
        mov	    w3, 1             // a bit
        lsl	    w3, w3, w1        // shift to pin location
        str	    w3, [x2, RIO_OE]  // make pin an output

        ret
