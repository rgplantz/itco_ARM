// Display hours, minutes, and seconds.
        .arch armv8-a
// Calling sequence
//    w0 <- value in seconds
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
        .global display_time
        .type   display_time, %function
display_time:
        stp     fp, lr, [sp, -FRAME]!     // Create stack frame
        mov     fp, sp                    // Set our frame pointer
        stp     x19, x20, [sp, save1920]  // For local vars

        mov     w1, 3600                  // 360 seconds per hour
        udiv    w20, w0, w1               // Hours
        msub    w19, w20, w1, w0          // Leaving seconds

        mov     w0, w20                   // Hours
        bl      put_uint
        mov     w0, ':'                   // Some formatting
        bl      write_char

        mov     w1, 60                    // 60 seconds per minute
        udiv    w20, w19, w1              // Minutes
        msub    w19, w20, w1, w19         // Leaving seconds

        mov     w0, w20                   // Minutes
        bl      put_uint
        mov     w0, ':'                   // Some formatting
        bl      write_char

        mov     w0, w19                   // Seconds
        bl      put_uint

        mov     w0, wzr                   // Return 0
        ldp     x19, x29, [sp, save1920]  // Restore for caller
        ldp     fp, lr, [sp], FRAME       // Delete stack frame
        ret                               // Back to caller
