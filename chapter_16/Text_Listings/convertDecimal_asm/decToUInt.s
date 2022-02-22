// decToUInt.s
// Convert decimal text string to unsigned int
// Calling sequence
//    x0 <- place to store unsigned int
//    x1 <- pointer to string
//    returns number of characters
        .arch armv8-a
// Useful constants
        .equ    BASE,10               // number base
        .equ    INTMASK,0x0f
// Program code
        .text
        .align  2
        .global decToUInt
        .type   decToUInt, %function
decToUInt:
        mov     w2, BASE              // radix = BASE
        mov     w3, wzr               // count = 0;
        mov     w5, wzr               // subtotal = 0;
convertLup:
        ldrb    w4, [x1]              // load character
        cbz     w4, allDone           // NUL char?
        and     w4, w4, INTMASK       // no, mask to integer
        mul     w5, w5, w2            // subtotal times BASE
        add     w5, w5, w4            // add new integer
        add     w3, w3, 1             // count++;
        add     x1, x1, 1             // stringPtr++;
        b       convertLup            // and continue
allDone:
        str     w5, [x0]              // *intPtr = subtotal;
        mov     w0, w3                // return count;
        ret
