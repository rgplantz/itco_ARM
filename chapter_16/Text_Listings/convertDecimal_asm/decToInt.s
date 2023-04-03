// Convert decimal text string to int
// Calling sequence
//    x0 <- place to store int
//    x1 <- pointer to string
//    returns number of characters
        .arch armv8-a
// Useful constants
        .equ    RADIX,10
        .equ    INTMASK,0x0f
// Program code
        .text
        .align  2
        .global decToInt
        .type   decToInt, %function
decToInt:
        mov     w2, wzr               // count = 0;
        mov     w3, wzr               // result = 0;
        mov     w4, wzr               // negative = false;
        mov     w5, RADIX             // handy to have in reg

        ldrb    w0, [x1]              // load first character
        cmp     w0, '-                // minus sign?
        b.ne    checkPos              // no, check for plus sign
        mov     x4, 1                 // yes, negative = true;
        add     x1, x1, 1             // increment string pointer
        b       convertLoop           // and convert numerals
checkPos:
        cmp     w0, '+                // plus sign?
        b.ne    convertLoop           // no, convert numerals
        add     x1, x1, 1             // yes, skip over it

convertLoop:
        ldrb    w0, [x1]              // load character
        cbz     w0, allDone           // NUL char?
        and     w0, w0, INTMASK       // no, mask to integer
        mul     w3, w3, w5            // result times RADIX
        add     w3, w3, w0            // add new integer
        add     w2, w2, 1             // count++;
        add     x1, x1, 1             // stringPtr++;
        b       convertLoop           // and continue
allDone:
        cbz     w4, positive          // check negative flag
        neg     w3, w3                // negate if flag is true
positive:
        str     w3, [x0]              // output result
        mov     w0, w2                // return counter
        ret                           // back to caller
