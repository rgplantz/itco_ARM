// Displays an int on screen
        .arch armv8-a
// Calling sequence
//    w0 <- the int
//    returns 0
// Useful constants
        .equ    MAX, 11               // maximum digits
// Stack frame
        .equ    theInt, 16
        .equ    theString, 20
        .equ    frame, 32
// Code
        .text
        .align  2
        .global putInt
        .type   putInt, %function
putInt:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        mov     w1, w0                // input
        add     x0, sp, theString     // place for output string
        bl      intToDec              // convert to text string

        add     x0, sp, theString     // display the int
        bl      writeStr

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
