// Gets a length in inches and 1/16s.
// Calling sequence
//    returns the fixed-point number
        .arch armv8-a
// Useful constants
        .equ    FOUR_BITS, 0xf        // for fraction
// Stack frame
        .equ    frame, 16
# Constant data
        .section	.rodata
        .align  3
prompt:
        .string "Enter length (inches and 1/16s)\n"
inches:
        .string "        Inches: "
fraction:
        .string "    Sixteenths: "
// Code
        .text
        .align  2
        .global get_length
        .type   get_length, %function
get_length:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        adr     x0, prompt            // ask for length
        bl      write_str
        adr     x0, inches            // ask for integer
        bl      write_str
        bl      get_int               // integer part
        lsl     w19, w0, 4            // 4 bits for fraction

        adr     x0, fraction          // ask for fraction
        bl      write_str
        bl      get_int               // fraction part
        and     w0, w0, FOUR_BITS     // make sure 1/16ths
        or      w0, w0, w19           // add integer part

        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
