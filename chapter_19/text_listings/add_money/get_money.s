// Gets dollars and cents from keyboard
// Calling sequence
//    returns integer amount as cents
        .arch armv8-a
// Stack frame
        .equ    save19, 16
        .equ    frame, 32
# Constant data
        .section	.rodata
        .align  3
prompt:
        .string "Enter amount (use same sign for dollars and cents)\n"
dollars:
        .string "   Dollars: "
cents:
        .string "     Cents: "
// Code
        .text
        .align  2
        .global get_money
        .type   get_money, %function
get_money:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        str     x19, [sp, save19]     // for local var

        adr     x0, prompt            // ask for amount
        bl      write_str
        adr     x0, dollars           // ask for dollars
        bl      write_str
        bl      get_int               // dollars
        mov     w1, 100               // 100 cents per dollar
        mul     w19, w0, w1           // scale

        adr     x0, cents             // ask for cents
        bl      write_str
        bl      get_int               // cents
        add     w0, w0, w19           // add scaled dollars

        ldr     x19, [sp, save19]     // restore for caller
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
