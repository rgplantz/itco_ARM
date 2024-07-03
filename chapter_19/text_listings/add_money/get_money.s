// Get dollars and cents from the keyboard.
// Calling sequence
//     Return integer amount as cents.
        .arch armv8-a
// Stack frame
        .equ    save19, 16
        .equ    FRAME, 32
# Constant data
        .section  .rodata
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
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        str     x19, [sp, save19]     // For local var

        adr     x0, prompt            // Ask for amount
        bl      write_str
        adr     x0, dollars           // Ask for dollars
        bl      write_str
        bl      get_int               // Dollars
        mov     w1, 100               // 100 cents per dollar
        mul     w19, w0, w1           // Scale

        adr     x0, cents             // Ask for cents
        bl      write_str
        bl      get_int               // Cents
        add     w0, w0, w19           // Add scaled dollars

        ldr     x19, [sp, save19]     // Restore for caller
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret                           // Back to caller
