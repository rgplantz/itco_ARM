// Convert a decimal text string to an int.
// Calling sequence
//    x0 <- place to store int
//    x1 <- pointer to string
//    Return number of characters.
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
        mov     w5, RADIX             // Handy to have in reg

        ldrb    w6, [x1]              // Load first character
        cmp     w6, '-                // Minus sign?
        b.ne    check_pos             // No, check for plus sign
        mov     x4, 1                 // Yes, negative = true;
        add     x1, x1, 1             // Increment string pointer
        b       convert               //   and convert numerals
check_pos:
        cmp     w6, '+                // Plus sign?
        b.ne    convert               // No, convert numerals
        add     x1, x1, 1             // Yes, skip over it

convert:
        ldrb    w6, [x1]              // Load character
        cbz     w6, check_sign        // NUL char?
        and     w6, w6, INTMASK       // No, mask to integer
        mul     w3, w3, w5            // result * RADIX
        add     w3, w3, w6            // Add new integer
        add     w2, w2, 1             // count++;
        add     x1, x1, 1             // string_ptr++;
        b       convert               //   and continue
check:
        cbz     w4, positive          // Check negative flag
        neg     w3, w3                // Negate if flag is true
positive:
        str     w3, [x0]              // Output result
        mov     w0, w2                // Return count
        ret                           // Back to caller
