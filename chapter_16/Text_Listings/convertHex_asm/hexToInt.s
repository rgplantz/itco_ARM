// Converts hex character string to int
// Calling sequence
//    x0 <- pointer to hex character string to convert
//    x1 <- pointer to int result
//    returns number of characters converted
        .arch armv8-a
// Useful constants
        .equ    INTPART, 0x0f         // also works for lowercase
        .equ    GAP, 0x07             // between numerals and alpha
// Program code
        .text
        .align  2
        .global hexToInt
        .type   hexToInt, %function
hexToInt:
        mov     w2, wzr               // result = 0
        mov     w3, wzr               // counter = 0;
convertLoop:
        ldrb    w4, [x0]              // load character
        cbz     w4, allDone           // NUL character?
        cmp     w4, '9                // numeral?
        b.ls    noGap                 // yes
        sub     w4, w4, GAP           // no, remove gap
noGap:
        and     w4, w4, INTPART       // 4-bit integer
        lsl     w2, w2, 4             // make room for it
        orr     w2, w2, w4            // insert new 4-bit integer
        add     x0, x0, 1             // increment source pointer
        add     w3, w3, 1             //        and counter
        b       convertLoop           // and continue
allDone:
        str     w2, [x1]              // output result
        mov     w0, w3                // return counter
        ret                           // back to caller
