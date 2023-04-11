// Reads a decimal integer from keyboard and converts to an int.
// Calling sequence
//    returns the int
        .arch armv8-a
// Useful constants
        .equ    MAX, 11                   // maximum digits
// Stack frame
// Stack frame
        .equ    theInt, 16
        .equ    theString, 20
        .equ    frame, 32
// Code
        .text
        .align  2
        .global getInt
        .type   getInt, %function
getInt:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        add     x0, sp, theString     // place to store input string
        mov     w1, MAX
        bl      readStr

        add     x1, sp, theString     // input
        add     x0, sp, theInt        // place for output
        bl      decToInt              // convert as int

        ldr     w0, [sp, theInt]      // return the int
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
