// Gets a length in inches and 1/16s.
// Calling sequence
//    returns the fixed-point number
        .arch armv8-a
// Useful constants
        .equ    FOUR_BITS, 0xf        // for fraction
// Stack frame
        .equ    save19, 16
        .equ    frame, 32
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
        str     x19, [sp, save19]     // for local var

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
        orr     w0, w0, w19           // add integer part

        ldp     x19, [sp, save19]     // restore for caller
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
