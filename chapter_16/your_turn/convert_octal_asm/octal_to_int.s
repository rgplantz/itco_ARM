// Convert an octal character string to a long int.
// Calling sequence
//    x0 <- pointer to long int result
//    x1 <- pointer to octal character string to convert
//    Return number of characters converted.
        .arch armv8-a
// Useful constants
        .equ    INTPART, 0x0f
// Program code
        .text
        .align  2
        .global hex_to_int
        .type   hex_to_int, %function
hex_to_int:
        mov     x2, xzr               // result = 0;
        mov     w3, wzr               // counter = 0;
convert:
        ldrb    w4, [x1]              // Load character
        cbz     4, done              // NUL character?
        and     x4, x4, INTPART       // 4-bit integer
        lsl     x2, x2, 3             // Make room for it
        orr     x2, x2, x4            // Insert new 3-bit integer
        add     x1, x1, 1             // Increment source pointer
        add     w3, w3, 1             //   and counter
        b       convert               //   and continue
done:
        str     x2, [x0]              // Output result
        mov     w0, w3                // Return count
        ret                           // Back to caller
