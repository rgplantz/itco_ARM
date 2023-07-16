// Displays lenght to nearest sixteenth
        .arch armv8-a
// Calling sequence
//    w0[31-4] <- integer part
//    w0[3-0]  <- fractional part
//    returns 0
// Useful constants
        .equ    FOUR_BITS, 0xf        // for fraction
// Stack frame
        .equ    save19, 16
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
        str     x19, [sp, save19]     // for local var

        mov     w19, w0               // save input
        lsr     w0, w19, 4            // integer part
        bl      put_uint

        mov     w0, ' '               // some formatting
        bl      write_char

        and     w0, w19, FOUR_BITS    // mosk off integer
        bl      put_uint              // fractional part

        adr     x0, sixteenths        // more formatting
        bl      write_str

        mov     w0, wzr               // return 0;
        ldr     x19, [sp, save19]     // restore for caller
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
