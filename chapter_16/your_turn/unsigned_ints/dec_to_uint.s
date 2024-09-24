// Convert a decimal text string to unsigned int.
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
        mov     w2, wzr               // count = 0
        mov     w3, wzr               // result = 0
        mov     w4, RADIX             // Handy to have in reg

convert:
        ldrb    w5, [x1]              // Load character
        cbz     w5, done              // NUL char?
        and     w5, w5, INTMASK       // No, mask to integer
        mul     w3, w3, w4            // Result times RADIX
        add     w3, w3, w5            // Add new integer
        add     w2, w2, 1             // Increment count
        add     x1, x1, 1             // Increment string pointer
        b       convert               //    and continue
done:
        str     w3, [x0]              // Output result
        mov     w0, w2                // Return counter
        ret
