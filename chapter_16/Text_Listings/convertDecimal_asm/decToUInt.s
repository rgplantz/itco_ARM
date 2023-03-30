// Convert decimal text string to unsigned int
// Calling sequence
//    x0 <- place to store unsigned int
//    x1 <- pointer to string
//    returns number of characters
        .arch armv8-a
// Useful constants
        .equ    RADIX,10
        .equ    INTMASK,0x0f
// Stack frame
        .equ    save1920, 16
        .equ    save2122, 32
        .equ    save23, 48
        .equ    frame, 64
// Program code
        .text
        .align  2
        .global decToUInt
        .type   decToUInt, %function
decToUInt:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        stp     x19, x20, [sp, save1920]  // save registers
        stp     x21, x22, [sp, save2122]
        str     x23, [sp, save23]

        mov     x19, x0               // place for result
        mov     x20, x1               // string to convert
        mov     w21, RADIX
        mov     w22, wzr              // count = 0;
        mov     w23, wzr              // result = 0;
convertLoop:
        ldrb    w0, [x20]             // load character
        cbz     w0, allDone           // NUL char?
        and     w0, w0, INTMASK       // no, mask to integer
        mul     w23, w23, w21         // result times RADIX
        add     w23, w23, w0          // add new integer
        add     w22, w22, 1           // count++;
        add     x20, x20, 1           // stringPtr++;
        b       convertLoop           // and continue
allDone:
        str     w23, [x19]            // output result
        mov     w0, w22               // return counter
        ldr     x23, [sp, save23]     // restore registers
        ldp     x21, x22, [sp, save2122]
        ldp     x19, x20, [sp, save1920]
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
