// Converts alphabetic letters in a C string to upper case
// Calling sequence
//    x0 <- pointer to result
//    x1 <- pointer to string to convert
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

        mov     x19, x0               // destination pointer
        mov     x20, x1               // source pointer
        mov     w21, wzr              // counter = 0;
convertLup:
        ldrb    w0, [x20]             // load character
        cbz     w0, allDone           // all done if NUL char
        movz    w1, UPMASK            // if not, do masking
        and     w0, w0, w1            // mask to upper
        strb    w0, [x19]             // store result
        add     x19, x19, 1           // increment destination pointer
        add     x20, x20, 1           //        source pointer
        add     w21, w21, 1           //        and counter
        b       convertLup            // and continue
allDone:
        strb    w0, [x19]             // terminating NUL got us here
        mov     x0, x21               // return counter
        ldr     x21, [sp, save21]     // restore registers
        ldp     x19, x20, [sp, save1920]
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
