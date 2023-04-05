// Converts an int to corresponding unsigned decimal text
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
        .equ    save1920, 16
        .equ    save2122, 32
        .equ    save23, 48
        .equ    reverseDec, 56
        .equ    frame, 80
// Code
        .text
        .align  2
        .global intToUDec
        .type   intToUDec, %function
intToUDec:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        stp     x19, x20, [sp, save1920]  // save registers
        stp     x21, x22, [sp, save2122]
        str     x23, [sp, save23]

        mov     x19, x0               // place for result
        mov     w20, w1               // value to convert
        mov     w21, RADIX
        add     x23, sp, reverseDec   // pointer to local string

        strb    wzr, [x23]            // store NUL
doWhile:
        add     x23, x23, 1           // increment pointer
        udiv    w0, w20, w21          // compute quotient
        msub    w1, w0, w21, w20      // remainder = quotient - RADIX * quotient
        orr     w1, w1, INT2CHAR      // convert to ascii
        strb    w1, [x23]             // store character
        mov     w20, w0               // remove remainder
        cbnz    w20, doWhile          // continue if more left

        mov     w22, wzr              // count = 0;
copyLoop:
        ldrb    w0, [x23]             // load character
        strb    w0, [x19]             // store it
        add     x19, x19, 1           // increment to pointer
        sub     x23, x23, 1           // decrement from pointer
        add     w22, w22, 1           // increment counter
        cbnz    w0, copyLoop          // continue until NUL char
        strb    w0, [x19]             // store NUL character

        mov     w0, w22               // return count;
        ldr     x23, [sp, save23]     // restore registers
        ldp     x21, x22, [sp, save2122]
        ldp     x19, x20, [sp, save1920]
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
