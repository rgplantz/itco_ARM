// Converts hex character string to int
// Calling sequence
//    x0 <- pointer to int result
//    x1 <- pointer to hex character string to convert
//    returns number of characters converted
        .arch armv8-a
// Useful constants
        .equ    INTPART, 0x0f         // also works for lowercase
        .equ    GAP, 0x07             // between numerals and alpha
// Program code
        .text
        .align  2
        .global hex_to_int
        .type   hex_to_int, %function
hex_to_int:
        mov     w2, wzr               // result = 0
        mov     w3, wzr               // counter = 0;
convert:
        ldrb    w4, [x1]              // load character
        cbz     w4, done              // NUL character?
        cmp     w4, '9                // numeral?
        b.ls    no_gap                // yes
        sub     w4, w4, GAP           // no, remove gap
no_gap:
        and     w4, w4, INTPART       // 4-bit integer
        lsl     w2, w2, 4             // make room for it
        orr     w2, w2, w4            // insert new 4-bit integer
        add     x1, x1, 1             // increment source pointer
        add     w3, w3, 1             //        and counter
        b       convert               // and continue
done:
        str     w2, [x0]              // output result
        mov     w0, w3                // return counter
        ret                           // back to caller
