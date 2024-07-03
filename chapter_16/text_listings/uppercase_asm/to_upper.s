// Convert alphabetic letters in a C string to uppercase.
// Calling sequence
//    x0 <- pointer to result
//    x1 <- pointer to string to convert
//    Return number of characters converted.
        .arch armv8-a
// Useful constant
        .equ    UPMASK, 0xdf
// Program code
        .text
        .align  2
        .global to_upper
        .type   to_upper, %function
to_upper:
        mov     w2, wzr               // counter = 0
convertLoop:
        ldrb    w3, [x1]              // Load character
        cbz     w3, allDone           // All done if NUL char
        movz    w4, UPMASK            // If not, do masking
        and     w3, w3, w4            // Mask to upper
        strb    w3, [x0]              // Store result
        add     x0, x0, 1             // Increment destination pointer,
        add     x1, x1, 1             //   source pointer,
        add     w2, w2, 1             //   and counter,
        b       convertLoop           //   and continue
allDone:
        strb    w3, [x0]              // Terminating NUL got us here
        mov     w0, w2                // Return count
        ret                           // Back to caller
