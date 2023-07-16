// Subtracts 123 from an integer
        .arch armv8-a
// Useful constants
        .equ    CONSTANT, 123             // number to subtract
        .equ    MAX, 11                   // maximum digits
// Stack frame
        .equ    the_int, 16
        .equ    the_string, 20
        .equ    frame, 32
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
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        adr     x0, prompt            // ask user for input
        bl      write_str
        add     x0, sp, the_string
        mov     w1, MAX
        bl      read_str

        add     x1, sp, the_string    // input
        add     x0, sp, the_int       // place for output
        bl      dec_to_int            // convert as int

        ldr     w1, [sp, the_int]
        sub     w1, w1, CONSTANT      // subtract our constant
        add     x0, sp, the_string    // place for output
        bl      int_to_dec            // convert to text string

        adr     x0, message           // tell user that
        bl      write_str
        add     x0, sp, the_string    //    this is the result
        bl      write_str
        mov     w0, '\n'
        bl      write_char

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
