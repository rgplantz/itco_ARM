// Displays dollars and cents
        .arch armv8-a
// Calling sequence
//    w0 <- value in cents
//    returns 0
// Stack frame
        .equ    save1920, 16
        .equ    FRAME, 32
# Constant data
        .section	.rodata
        .align  3
// Code
        .text
        .align  2
        .global display_money
        .type   display_money, %function
display_money:
        stp     fp, lr, [sp, -FRAME]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        stp     x19, x20, [sp, save1920]  // for local vars

        mov     w1, 100               // 100 cents per dollar
        sdiv    w20, w0, w1           // dollars
        msub    w19, w20, w1, w0      // leaving cents

        mov     w0, '$'               // some formatting
        bl      write_char
        mov     w0, w20               // dollars
        bl      put_int

        mov     w0, '.'               // some formatting
        bl      write_char
        cmp     w19, wzr              // negative?
        cneg    w19, w19, mi          // make non-negative
        cmp     w19, 10               // check for single digit
        b.hs    no_zero               // two digits
        mov     w0, '0'               // one digit needs leading '0'
        bl      write_char
no_zero:
        mov     w0, w19               // cents
        bl      put_int

        mov     w0, wzr               // return 0;
        ldp     x19, x29, [sp, save1920]  // restore for caller
        ldp     fp, lr, [sp], FRAME   // restore fp, lr, sp
        ret                           // back to caller
