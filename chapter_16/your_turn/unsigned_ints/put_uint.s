// Display an unsigned int on screen.
        .arch armv8-a
// Calling sequence
//    w0 <- the int
//    returns 0
// Useful constants
        .equ    MAX, 11               // Maximum digits
// Stack frame
        .equ    an_int, 16
        .equ    a_string, 20
        .equ    FRAME, 32
// Code
        .text
        .align  2
        .global put_uint
        .type   put_uint, %function
put_uint:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Our frame pointer

        mov     w1, w0                // Input
        add     x0, sp, a_string      // Place for output string
        bl      uint_to_dec           // Convert to text string

        add     x0, sp, a_string      // Display the int
        bl      write_str

        mov     w0, 0                 // Return 0
        ldp     x29, x30, [sp], FRAME // Delete stack frame
        ret
