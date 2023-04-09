// Converts an int to corresponding decimal text
// string representation.
// Calling sequence
//    x0 <- place to store string
//    w1 <- the int
//    returns number of characters in string
        .arch armv8-a
// Useful constants
        .equ    RADIX, 10             // number base
        .equ    INT2CHAR, 0x30        // ascii zero
        .equ    MINUS, '-             // minus sign
// Stack frame
// Stack frame
        .equ    reverseDec, 0
        .equ    frame, 16
// Code
        .text
        .align  2
        .global intToDec
        .type   intToDec, %function
intToDec:
        sub     sp, sp, frame         // local string on stack

        mov     w2, wzr               // count = 0
        cmp     w1, wzr               // => 0?
        tbz     w1, 31, nonNegative   // yes, go to conversion
        neg     w1, w1                // no, negate int
        mov     w3, MINUS
        strb    w3, [x0]              // start with minus sign
        add     x0, x0, 1             // increment pointer
        add     w2, w2, 1             // increment counter
nonNegative:
        add     x3, sp, reverseDec    // pointer to local string storage
        strb    wzr, [x3]             // start with NUL
        mov     w4, RADIX             // put in register
doWhile:
        add     x3, x3, 1             // increment local pointer
        udiv    w5, w1, w4            // compute quotient
        msub    w6, w5, w4, w1        // remainder = quotient - RADIX * quotient
        orr     w6, w6, INT2CHAR      // convert to ascii
        strb    w6, [x3]              // store character
        mov     w1, w5                // remove remainder
        cbnz    w1, doWhile           // continue if more left

copyLoop:
        ldrb    w6, [x3]              // load character
        strb    w6, [x0]              // store it
        add     x0, x0, 1             // increment to pointer
        sub     x3, x3, 1             // decrement from pointer
        add     w2, w2, 1             // increment counter
        cbnz    w6, copyLoop          // continue until NUL char
        strb    w6, [x0]              // store NUL character

        mov     w0, w2                // return count;
        add     sp, sp, frame         // restore sp
        ret                           // back to caller
