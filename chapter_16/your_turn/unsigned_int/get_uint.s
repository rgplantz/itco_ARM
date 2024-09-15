// Read a decimal integer from keyboard and convert to an unsigned int.
// Calling sequence
//    returns the int
        .arch armv8-a
// Useful constants
        .equ    MAX, 10               // Maximum digits
// Stack frame
        .equ    an_int, 16
        .equ    a_string, 20
        .equ    FRAME, 32
// Code
        .text
        .align  2
        .global get_uint
        .type   get_uint, %function
get_uint:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Our frame pointer

        mov     w1, MAX
        add     x0, sp, a_string      // Place to store input string
        bl      read_str

        add     x1, sp, a_string      // Address of input
        add     x0, sp, an_int        // Place for output
        bl      dec_to_uint           // Convert as unsigned int

        ldr     w0, [sp, an_int]      // Return the int
        ldp     x29, x30, [sp], FRAME // Delete stack frame
        ret
