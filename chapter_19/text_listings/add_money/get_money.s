// Gets dollars and cents.
// Calling sequence
//    returns integer amount as cents
        .arch armv8-a
// Useful constants
        .equ    TO_CENTS, 10          // dollars to cents
// Stack frame
        .equ    save19, 16
        .equ    frame, 32
# Constant data
        .section	.rodata
        .align  3
prompt:
        .string "Enter amount\n"
dollars:
        .string "       Dollars: "
cents:
        .string "         Cents: "
// Code
        .text
        .align  2
        .global get_length
        .type   get_length, %function
get_length:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        str     x19, [sp, save19]     // for local var

        adr     x0, prompt            // ask for amount
        bl      write_str
        adr     x0, dollars           // ask for dollars
        bl      write_str
        bl      get_int               // dollars
        mul     w19, w0, TO_CENTS     // scale

        adr     x0, cents             // ask for cents
        bl      write_str
        bl      get_int               // cents
        add     w0, w0, w19           // add scaled dollars

        ldr     x19, [sp, save19]     // restore for caller
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
