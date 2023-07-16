// Convert decimal text string to unsigned int
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
        .global dec_to_uint
        .type   dec_to_uint, %function
dec_to_uint:
        mov     w2, wzr               // count = 0;
        mov     w3, wzr               // result = 0;
        mov     w4, RADIX             // handy to have in reg

convert:
        ldrb    w5, [x1]              // load character
        cbz     w5, done              // NUL char?
        and     w5, w5, INTMASK       // no, mask to integer
        mul     w3, w3, w4            // result times RADIX
        add     w3, w3, w5            // add new integer
        add     w2, w2, 1             // count++;
        add     x1, x1, 1             // stringPtr++;
        b       convert               // and continue
done:
        str     w3, [x0]              // output result
        mov     w0, w2                // return counter
        ret                           // back to caller
