// Convert an int to its decimal text string representation.
// Calling sequence
//    x0 <- place to store string
//    w1 <- the int
//    Return number of characters in the string.
        .arch armv8-a
// Useful constants
        .equ    RADIX, 10             // Number base
        .equ    INT2CHAR, 0x30        // ASCII zero
        .equ    MINUS, '-             // Minus sign
// Stack frame
        .equ    reverse, 0
        .equ    FRAME, 16
// Code
        .text
        .align  2
        .global int_to_dec
        .type   int_to_dec, %function
int_to_dec:
        sub     sp, sp, FRAME         // Local string on stack

        cmp     w1, wzr               // => 0?
        tbz     w1, 31, non_negative  // Yes, go to conversion
        neg     w1, w1                // No, negate int
        mov     w2, MINUS
        strb    w2, [x0]              // Start with minus sign
        add     x0, x0, 1             // Increment pointer
non_negative:
        add     x3, sp, reverse       // Pointer to local string storage
        strb    wzr, [x3]             // Create end with NUL
        mov     w2, RADIX             // Put in register
do_while:
        add     x3, x3, 1             // Increment local pointer
        udiv    w4, w1, w2            // Quotient = dividend / RADIX
        msub    w5, w4, w2, w1        // Rem. = dividend - RADIX * quot.
        orr     w5, w5, INT2CHAR      // Convert to ASCII
        strb    w5, [x3]              // Store character
        mov     w1, w4                // Remove remainder
        cbnz    w1, do_while          // Continue if more left

        mov     w6, wzr               // count = 0
copy:
        ldrb    w5, [x3]              // Load character
        strb    w5, [x0]              // Store it
        add     x0, x0, 1             // Increment to pointer
        sub     x3, x3, 1             // Decrement from pointer
        add     w6, w6, 1             // Increment counter
        cbnz    w5, copy              // Continue until NUL char
        strb    w5, [x0]              // Store NUL character

        mov     w0, w6                // Return count
        add     sp, sp, FRAME         // Delete stack frame
        ret                           // Back to caller
