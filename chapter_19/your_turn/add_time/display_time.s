// Display dollars and cents.
        .arch armv8-a
// Calling sequence
//    w0 <- value in cents
//    Return 0.
// Stack frame
        .equ    save1920, 16
        .equ    FRAME, 32
# Constant data
        .section  .rodata
        .align  3
// Code
        .text
        .align  2
        .global display_money
        .type   display_money, %function
display_money:
        stp     fp, lr, [sp, -FRAME]!     // Create stack frame
        mov     fp, sp                    // Set our frame pointer
        stp     x19, x20, [sp, save1920]  // For local vars

        mov     w1, 100                   // 100 cents per dollar
        sdiv    w20, w0, w1               // Dollars
        msub    w19, w20, w1, w0          // Leaving cents

        mov     w0, '$'                   // Some formatting
        bl      write_char
        mov     w0, w20                   // Dollars
        bl      put_int

        mov     w0, '.'                   // Some formatting
        bl      write_char
        cmp     w19, wzr                  // Negative?
        cneg    w19, w19, mi              // Make non-negative
        cmp     w19, 10                   // Check for single digit
        b.hs    no_zero                   // Two digits
        mov     w0, '0'                   // One digit needs leading '0'
        bl      write_char
no_zero:
        mov     w0, w19                   // Cents
        bl      put_int

        mov     w0, wzr                   // Return 0
        ldp     x19, x29, [sp, save1920]  // Restore for caller
        ldp     fp, lr, [sp], FRAME       // Delete stack frame
        ret                               // Back to caller
