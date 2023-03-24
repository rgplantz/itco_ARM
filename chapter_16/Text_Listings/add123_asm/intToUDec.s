// intToUDec.s
// Convert unsigned int to decimal text string
// Calling sequence
//    x0 <- place to store string
//    w1 <- the int
//    returns number of characters in string
        .arch armv8-a
// Useful constants
        .equ    RADIX, 10             // number base
        .equ    INT2CHAR, 0x30        // ascii zero
// Stack frame
        .equ    frameSize, 32         // for reversed string
// Code
        .text
        .align  2
        .global intToUDec
        .type   intToUDec, %function
intToUDec:
        sub     sp, sp, frameSize     // place for local string
        mov     w2, RADIX             // decimal
        mov     w3, 0                 // count = 0
        mov     x4, sp                // pointer to local string
        strb    wzr, [x4]             // store NUL
        add     x4, x4, 1             // and increment pointer
doWhile:
        udiv    w5, w1, w2            // compute quotient
        msub    w6, w5, w2, w1        // w6 = quotient - RADIX * quotient
        orr     w7, w7, INT2CHAR      // convert to ascii
        strb    w7, [x4]              // store character
        add     x4, x4, 1             // increment pointer
        add     w3, w3, 1             // increment counter
        mov     w1, w5                // remove remainder
        cbnz    w1, doWhile           // continue if more left
copyLoop:
        sub     x4, x4, 1             // decrement from pointer
        ldrb    w2, [x4]              // load character
        strb    w2, [x0]              // store it
        add     x0, x0, 1             // increment to pointer
        cbnz    w2, copyLoop          // continue until NUL char

        mov     w0, w3                // return count;
        add     sp, sp, frameSize     // delete local storage
        ret
