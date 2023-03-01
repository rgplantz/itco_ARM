// Converts alphabetic letters in a C string to upper case
// Calling sequence
//    x0 <- pointer to string to convert
//    x1 <- pointer to result
//    returns number of characters converted
        .arch armv8-a
// Useful constants
        .equ    UPMASK, 0xdf
// Stack frame
        .equ    save1920, 16
        .equ    save21, 32
        .equ    frame, 48
// Program code
        .text
        .align  2
        .global toUpper
        .type   toUpper, %function
toUpper:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        stp     x19, x20, [sp, save1920]  // save registers
        str     x21, [sp, save21]

        mov     x19, x0               // source pointer
        mov     x20, x1               // destination pointer
        mov     w21, wzr              // counter = 0;
convertLup:
        ldrb    w0, [x19]             // load character
        movz    w1, UPMASK            // our mask
        and     w0, w0, w1            // mask to upper
        strb    w0, [x20]             // store result
        cbz     w0, allDone           // all done if NUL char
        add     x19, x19, 1           // increment source pointer
        add     x20, x20, 1           //        destination pointer
        add     w21, w21, 1           //        and counter
        b       convertLup            // and continue
allDone:
        mov     x0, x21               // return counter
        ldr     x21, [sp, save21]     // restore registers
        ldp     x19, x20, [sp, save1920]
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
