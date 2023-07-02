// Converts alphabetic letters in a C string to upper case
// Calling sequence
//    x0 <- pointer to result
//    x1 <- pointer to string to convert
//    returns number of characters converted
        .arch armv8-a
// Useful constant
        .equ    UPMASK, 0xdf
// Program code
        .text
        .align  2
        .global toUpper
        .type   toUpper, %function
toUpper:
        mov     w2, wzr               // counter = 0;
convertLoop:
        ldrb    w3, [x1]              // load character
        cbz     w3, allDone           // all done if NUL char
        movz    w4, UPMASK            // if not, do masking
        and     w3, w3, w4            // mask to upper
        strb    w3, [x0]              // store result
        add     x0, x0, 1             // increment destination pointer
        add     x1, x1, 1             //        source pointer
        add     w2, w2, 1             //        and counter
        b       convertLoop           // and continue
allDone:
        strb    w3, [x0]              // terminating NUL got us here
        mov     w0, w2                // return counter
        ret                           // back to caller
