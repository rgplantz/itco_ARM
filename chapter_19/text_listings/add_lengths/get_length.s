// Gets a length in inches and 1/16s.
// Calling sequence
//    returns the fixed-point number
        .arch armv8-a
// Stack frame
        .equ    save19, 16
        .equ    FRAME, 32
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
        stp     fp, lr, [sp, -FRAME]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        str     x19, [sp, save19]     // for local var

        adr     x0, prompt            // ask for length
        bl      write_str
        adr     x0, inches            // ask for integer
        bl      write_str
        bl      get_uint              // integer part
        lsl     w19, w0, 4            // 4 bits for fraction

        adr     x0, fraction          // ask for fraction
        bl      write_str
        bl      get_uint              // fraction part
        add     w0, w0, w19           // add integer part

        ldr     x19, [sp, save19]     // restore for caller
        ldp     fp, lr, [sp], FRAME   // restore fp, lr, sp
        ret                           // back to caller
