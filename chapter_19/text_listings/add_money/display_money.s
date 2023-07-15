// Displays dollars and cents
        .arch armv8-a
// Calling sequence
//    w0 <- value in cents
//    returns 0
// Useful constants
        .equ    TO_DOLLARS, 10        // cents to dollars
// Stack frame
        .equ    save1920, 16
        .equ    frame, 32
# Constant data
        .section	.rodata
        .align  3
// Code
        .text
        .align  2
        .global display_money
        .type   display_money, %function
display_money:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        stp     x19, x20, [sp, save1920]  // for local vars

        sdiv    w20, w0, TO_DOLLARS   // dollars
        sub     w19, w19, w20         // leaving cents

        mov     w0, '$'               // some formatting
        bl      write_char
        mov     w0, w20               // dollars
        bl      put_int

        mov     w0, '.'               // some formatting
        bl      write_char
        mov     w0, w19               // cents
        bl      put_int

        mov     w0, wzr               // return 0;
        ldp     x19, x29, [sp, save1920]  // restore for caller
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
