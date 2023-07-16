// Converts an unsigned int to corresponding decimal text
// string representation.
// Calling sequence
//    x0 <- place to store string
//    w1 <- the int
//    returns number of characters in string
        .arch armv8-a
// Useful constants
        .equ    RADIX, 10             // number base
        .equ    INT2CHAR, 0x30        // ascii zero
// Stack frame
// Stack frame
        .equ    reverse, 0
        .equ    frame, 16
// Code
        .text
        .align  2
        .global uint_to_dec
        .type   uint_to_dec, %function
uint_to_dec:
        sub     sp, sp, frame         // local string on stack

        add     x3, sp, reverse       // pointer to local string storage
        strb    wzr, [x3]             // create end with NUL
        mov     w2, RADIX             // put in register
do_while:
        add     x3, x3, 1             // increment local pointer
        udiv    w4, w1, w2            // compute quotient
        msub    w5, w4, w2, w1        // remainder = quotient - RADIX * quotient
        orr     w5, w5, INT2CHAR      // convert to ascii
        strb    w5, [x3]              // store character
        mov     w1, w4                // remove remainder
        cbnz    w1, do_while          // continue if more left

        mov     w6, wzr               // count = 0
copy:
        ldrb    w5, [x3]              // load character
        strb    w5, [x0]              // store it
        add     x0, x0, 1             // increment to pointer
        sub     x3, x3, 1             // decrement from pointer
        add     w6, w6, 1             // increment counter
        cbnz    w5, copy              // continue until NUL char
        strb    w5, [x0]              // store NUL character

        mov     w0, w6                // return count;
        add     sp, sp, frame         // restore sp
        ret                           // back to caller
