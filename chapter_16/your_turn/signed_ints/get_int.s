// Read a decimal integer from keyboard and convert to an int.
// Calling sequence
//    returns the int
        .arch armv8-a
// Useful constants
        .equ    MAX, 11                   // maximum digits
// Stack frame
        .equ    an_int, 16
        .equ    a_string, 20
        .equ    frame, 32
// Code
        .text
        .align  2
        .global get_int
        .type   get_int, %function
get_int:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        mov     w1, MAX
        add     x0, sp, a_string      // place to store input string
        bl      read_str

        add     x1, sp, a_string      // input
        add     x0, sp, an_int        // place for output
        bl      dec_to_int            // convert as int

        ldr     w0, [sp, an_int]      // return the int
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
