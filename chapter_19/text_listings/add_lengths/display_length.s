// Displays lenght to nearest sixteenth
        .arch armv8-a
// Calling sequence
//    w0[31-4] <- integer part
//    w0[3-0]  <- fractional part
//    returns 0
// Useful constants
        .equ    FOUR_BITS, 0xf        // for fraction
// Stack frame
        .equ    number, 16
        .equ    frame, 32
# Constant data
        .section	.rodata
        .align  3
sixteenths:
        .string "/16"
// Code
        .text
        .align  2
        .global display_length
        .type   display_length, %function
display_length:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        str     w0, [sp, number]      // save input value

        lsr     w0, w0, 4             // integer part
        bl      put_int

        mov     w0, ' '               // some formatting
        bl      write_char

        ldr     w0, [sp, number]      // retrieve input
        and     w0, w0, FOUR_BITS     // mosk off integer
        bl      put_int               // fractional part

        adr     x0, sixteenths        // more formatting
        bl      write_str

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
