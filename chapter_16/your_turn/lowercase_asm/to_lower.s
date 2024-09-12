// Convert alphabetic letters in a C string to lowercase.
// Calling sequence
//    x0 <- pointer to result
//    x1 <- pointer to string to convert
//    Return number of characters converted.
        .arch armv8-a
// Useful constant
        .equ    LOWMASK, 0x20
// Program code
        .text
        .align  2
        .global to_lower
        .type   to_lower, %function
to_lower:
        mov     w2, wzr               // counter = 0
loop:
        ldrb    w3, [x1]              // Load character
        cbz     w3, done              // All done if NUL char
        movz    w4, LOWMASK           // If not, do masking
        orr     w3, w3, w4            // Mask to lower
        strb    w3, [x0]              // Store result
        add     x0, x0, 1             // Increment destination pointer,
        add     x1, x1, 1             //   source pointer,
        add     w2, w2, 1             //   and counter,
        b       convertLoop           //   and continue
done:
        strb    w3, [x0]              // Terminating NUL got us here
        mov     w0, w2                // Return count
        ret                           // Back to caller
