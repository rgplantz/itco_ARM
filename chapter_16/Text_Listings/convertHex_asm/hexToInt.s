// Converts hex character string to int
// Calling sequence
//    x0 <- pointer to hex character string to convert
//    x1 <- pointer to int result
//    returns number of characters converted
        .arch armv8-a
// Useful constants
        .equ    INTPART, 0x0f         // also works for lowercase
        .equ    GAP, 0x07             // between numerals and alpha
// Stack frame
        .equ    save1920, 16
        .equ    save2122, 32
        .equ    frame, 48
// Program code
        .text
        .align  2
        .global hexToInt
        .type   hexToInt, %function
hexToInt:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        stp     x19, x20, [sp, save1920]  // save registers
        stp     x21, x22, [sp, save2122]

        mov     x19, x0               // string pointer
        mov     x20, x1               // output location
        mov     w21, wzr              // result = 0
        mov     w22, wzr              // counter = 0;
convertLup:
        ldrb    w0, [x19]             // load character
        cbz     w0, allDone           // NUL character
        cmp     w0, '9                // numeral?
        b.ls    noGap                 // yes
        sub     w0, w0, GAP           // no, remove gap
noGap:
        and     x0, x0, INTPART       // 4-bit integer
        lsl     w21, w21, 4           // make room for it
        orr     w21, w21, x0          // insert new 4-bit integer
        add     x19, x19, 1           // increment source pointer
        add     w22, w22, 1           //        and counter
        b       convertLup            // and continue
allDone:
        str     w21, [x20]            // output result
        mov     w0, w22               // return counter
        ldp     x21, x22, [sp, save2122]  // restore registers
        ldp     x19, x20, [sp, save1920]
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
