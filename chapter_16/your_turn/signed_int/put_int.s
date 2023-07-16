// Displays an int on screen
        .arch armv8-a
// Calling sequence
//    w0 <- the int
//    returns 0
// Useful constants
        .equ    MAX, 11               // maximum digits
// Stack frame
        .equ    an_int, 16
        .equ    a_string, 20
        .equ    frame, 32
// Code
        .text
        .align  2
        .global put_int
        .type   put_int, %function
put_int:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        mov     w1, w0                // input
        add     x0, sp, a_string      // place for output string
        bl      int_to_dec            // convert to text string

        add     x0, sp, a_string      // display the int
        bl      write_str

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
