// Convert decimal text string to int
// Calling sequence
//    x0 <- place to store int
//    x1 <- pointer to string
//    returns number of characters
        .arch armv8-a
// Useful constants
        .equ    RADIX,10
        .equ    INTMASK,0x0f
// Stack frame
        .equ    save1920, 16
        .equ    save2122, 32
        .equ    save2324, 48
        .equ    frame, 64
// Program code
        .text
        .align  2
        .global uDecToInt
        .type   uDecToInt, %function
uDecToInt:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        stp     x19, x20, [sp, save1920]  // save registers
        stp     x21, x22, [sp, save2122]
        stp     x23, x24, [sp, save2324]

        mov     x19, x0               // place for result
        mov     x20, x1               // string to convert
        mov     w21, RADIX
        mov     w22, wzr              // count = 0;
        mov     w23, wzr              // result = 0;
        mov     w24, wzr              // negative = false;

        ldrb    w0, [x20]             // load first character
        cmp     w0, '-                // minus sign?
        b.ne    checkPos              // no, check for plus sign
        mov     x24, 1                // yes, negative = true;
        add     x20, x20, 1           // increment string pointer
        back    convertLoop           // and convert numerals
checkPos:
        cmp     w0, '+                // plus sign?
        b.ne    convertLoop           // no, convert numerals
        add     x20, x20, 1           // yes, skip over it

convertLoop:
        ldrb    w0, [x20]             // load character
        cbz     w0, allDone           // NUL char?
        and     w0, w0, INTMASK       // no, mask to integer
        mul     w23, w23, w21         // result times RADIX
        add     w23, w23, w0          // add new integer
        add     w22, w22, 1           // count++;
        add     x20, x20, 1           // stringPtr++;
        b       convertLoop           // and continue
allDone:
        cbz     w24, positive         // check negative flag
        neg     w24, w24              // negate if flag is true
positive:
        str     w23, [x19]            // output result
        mov     w0, w22               // return counter
        ldp     x23, x24, [sp, save2324]  // restore registers
        ldp     x21, x22, [sp, save2122]
        ldp     x19, x20, [sp, save1920]
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
