// Subtract 123 from an integer.
        .arch armv8-a
// Useful constants
        .equ    CONSTANT, 123         // Number to subtract
        .equ    MAX, 11               // Maximum digits
// Stack frame
        .equ    the_int, 16
        .equ    the_string, 20
        .equ    FRAME, 32
// Code
        .text
        .section  .rodata
        .align  3
        prompt:
        .string "Enter an integer: "
message:
        .string "The result is: "
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Our frame pointer

        adr     x0, prompt            // Prompt message
        bl      write_str             // Ask for input
        add     x0, sp, the_string
        mov     w1, MAX
        bl      read_str

        add     x1, sp, the_string    // Input
        add     x0, sp, the_int       // Place for output
        bl      dec_to_int            // Convert to int

        ldr     w1, [sp, the_int]
        sub     w1, w1, CONSTANT      // Subtract our constant
        add     x0, sp, the_string    // Place for output
        bl      int_to_dec            // Convert to text string

        adr     x0, message           // Tell user that
        bl      write_str
        add     x0, sp, the_string    //   this is the result
        bl      write_str
        mov     w0, '\n'
        bl      write_char

        mov     w0, wzr               // Return 0
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret                           // Back to caller
