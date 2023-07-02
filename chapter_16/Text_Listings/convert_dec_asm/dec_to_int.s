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
        .global dec_to_int
        .type   dec_to_int, %function
dec_to_int:
        mov     w2, wzr               // count = 0;
        mov     w3, wzr               // result = 0;
        mov     w4, wzr               // negative = false;
        mov     w5, RADIX             // handy to have in reg

        ldrb    w6, [x1]              // load first character
        cmp     w6, '-                // minus sign?
        b.ne    check_pos             // no, check for plus sign
        mov     x4, 1                 // yes, negative = true;
        add     x1, x1, 1             // increment string pointer
        b       convert               // and convert numerals
check_pos:
        cmp     w6, '+                // plus sign?
        b.ne    convert               // no, convert numerals
        add     x1, x1, 1             // yes, skip over it

convert:
        ldrb    w6, [x1]              // load character
        cbz     w6, check_sign        // NUL char?
        and     w6, w6, INTMASK       // no, mask to integer
        mul     w3, w3, w5            // result times RADIX
        add     w3, w3, w6            // add new integer
        add     w2, w2, 1             // count++;
        add     x1, x1, 1             // stringPtr++;
        b       convert               // and continue
check_sign:
        cbz     w4, positive          // check negative flag
        neg     w3, w3                // negate if flag is true
positive:
        str     w3, [x0]              // output result
        mov     w0, w2                // return counter
        ret                           // back to caller
