// Converts a long int to corresponding decimal text
// string representation.
// Calling sequence
//    x0 <- place to store string
//    x1 <- the int
//    returns number of characters in string
        .arch armv8-a
// Useful constants
        .equ    RADIX, 10             // number base
        .equ    INT2CHAR, 0x30        // ascii zero
        .equ    MINUS, '-             // minus sign
// Stack frame
// Stack frame
        .equ    reverseDec, 0
        .equ    frame, 32
// Code
        .text
        .align  2
        .global intToDec
        .type   intToDec, %function
intToDec:
        sub     sp, sp, frame         // local string on stack

        cmp     x1, xzr               // => 0?
        tbz     x1, 31, nonNegative   // yes, go to conversion
        neg     x1, x1                // no, negate int
        mov     w2, MINUS
        strb    w2, [x0]              // start with minus sign
        add     x0, x0, 1             // increment pointer
nonNegative:
        add     x3, sp, reverseDec    // pointer to local string storage
        strb    wzr, [x3]             // create end with NUL
        mov     x2, RADIX             // put in register
doWhile:
        add     x3, x3, 1             // increment local pointer
        udiv    x4, x1, x2            // compute quotient
        msub    x5, x4, x2, x1        // remainder = quotient - RADIX * quotient
        orr     x5, x5, INT2CHAR      // convert to ascii
        strb    w5, [x3]              // store character
        mov     x1, x4                // remove remainder
        cbnz    x1, doWhile           // continue if more left

        mov     w6, wzr               // count = 0
copyLoop:
        ldrb    w5, [x3]              // load character
        strb    w5, [x0]              // store it
        add     x0, x0, 1             // increment to pointer
        sub     x3, x3, 1             // decrement from pointer
        add     w6, w6, 1             // increment counter
        cbnz    w5, copyLoop          // continue until NUL char
        strb    w5, [x0]              // store NUL character

        mov     w0, w6                // return count;
        add     sp, sp, frame         // restore sp
        ret                           // back to caller
