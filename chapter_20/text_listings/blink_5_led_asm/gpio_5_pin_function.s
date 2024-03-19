// Selects a function for a GPIO pin. Assumes that GPIO registers
// have been mapped to application memory.
// Calling sequence:
//      x0 <- address of GPIO in mapped memory
//      w1 <- GPIO pin number

// Constants
        .equ    PIN_FUNCTION, 5   // 
        .equ    PAD_AMPS, 0x10    // 2 ma

// Code
        .text
        .align  2
        .global gpio_pin_function
        .type   gpio_pin_function, %function
gpio_pin_function:
        mov     w3, w1            // pin number
        add	    x1, x0, 0x10000   // x1 = RIOBase
        add	    x2, x0, 0x20000   // x2 = PADBase
        add	    x2, x2, 4         // x2 = pad
        lsl	    x4, x3, 3         // 8 x pin number
        add	    x5, x0, x4        // GPIOBase + 8 x pin number
        mov	    w6, PIN_FUNCTION  // fn
        str	    w6, [x5, 4]       // GPIO[pin].ctrl = fn;

        lsl	    x4, x3, 2         // 4 x pin number
        add	    x5, x2, x4        // pad address + 4 x pin number
        mov	    w6, PAD_AMPS      // 0x10
        str	    w6, [x5]          // set pad amps
        mov	    w6, 1             // 1
        lsl	    w6, w6, w3        // shift to pin location
        add	    x5, x1, 0x2000    // 0x2000
        str	    w6, [x5, 4]       // 

        mov     x0, x1            // return RIOBase
        ret
