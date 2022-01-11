// intToUDec.s
// Convert unsigned int to decimal text string
// Calling sequence
//    x0 <- place to store string
//    w1 <- the int
//    returns number of characters in string
        .arch armv8-a
// Useful constants
        .equ    BASE,10               // number base
        .equ    INT2CHAR,0x30         // ascii zero
// Stack frame
        .equ    frameSize,32
// Code
        .text
        .align  2
        .global intToUDec
        .type   intToUDec, %function
intToUDec:
        sub     sp, sp, frameSize     // create stack frame
        mov     w2, BASE              // decimal
        mov     w3, -1                // count = -1, allow for NUL
        mov     x4, sp                // pointer to local string
        strb    wzr, [x4]             // store NUL
        add     x4, x4, 1             // and increment pointer
doWhile:
        udiv    w5, w1, w2            // compute quotient
        mul     w6, w5, w2            // w6 = BASE X quotient
        sub     w7, w1, w6            // w7 = remainder
        orr     w7, w7, INT2CHAR      // convert to ascii
        strb    w7, [x4]              // store character
        add     x4, x4, 1             // increment pointer
        mov     w1, w5                // remove remainder
        cmp     w1, wzr               // anything left?
        bne     doWhile               // yes, continue
copyLoop:
        sub     x4, x4, 1             // decrement from pointer
        ldrb    w2, [x4]              // load character
        strb    w2, [x0]              // store it
        add     x0, x0, 1             // increment to pointer
        cmp     w2, wzr               // was it NUL?
        bne     copyLoop              // no, continue
        add     sp, sp, frameSize     // yes, undo stack frame
        ret
