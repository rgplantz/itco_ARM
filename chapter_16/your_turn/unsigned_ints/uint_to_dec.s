// Convert a decimal text string to unsigned int.
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
        .equ    reverse, 0
        .equ    FRAME, 16
// Code
        .text
        .align  2
        .global uint_to_dec
        .type   uint_to_dec, %function
uint_to_dec:
        sub     sp, sp, FRAME         // Local string on stack

        add     x3, sp, reverse       // Pointer to local string storage
        strb    wzr, [x3]             // Create end with NUL
        mov     w2, RADIX             // Put in register
do_while:
        add     x3, x3, 1             // Increment local pointer
        udiv    w4, w1, w2            // Compute quotient
        msub    w5, w4, w2, w1        // remainder = quotient - RADIX * quotient
        orr     w5, w5, INT2CHAR      // Convert to ascii
        strb    w5, [x3]              // Store character
        mov     w1, w4                // Remove remainder
        cbnz    w1, do_while          // Continue if more left

        mov     w6, wzr               // count = 0
copy:
        ldrb    w5, [x3]              // Load character
        strb    w5, [x0]              //    and store it
        add     x0, x0, 1             // Increment to pointer
        sub     x3, x3, 1             // Decrement from pointer
        add     w6, w6, 1             // Increment counter
        cbnz    w5, copy              // Continue until NUL char
        strb    w5, [x0]              // Store NUL character

        mov     w0, w6                // Return count;
        add     sp, sp, FRAME         // Restore sp
        ret
