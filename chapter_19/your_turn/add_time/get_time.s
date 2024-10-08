// Get hours, minute, and seconds from the keyboard.
// Calling sequence
//     Return integer amount as seconds.
        .arch armv8-a
// Stack frame
        .equ    save19, 16
        .equ    FRAME, 32
# Constant data
        .section  .rodata
        .align  3
hours:
        .string "      Hours: "
minutes:
        .string "    Minutes: "
seconds:
        .string "    Seconds: "
// Code
        .text
        .align  2
        .global get_time
        .type   get_time, %function
get_time:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        str     x19, [sp, save19]     // For local var

        adr     x0, hours             // Ask for hours
        bl      write_str
        bl      get_uint              // Hours
        mov     w1, 3600              // 3600 seconds per hour
        mul     w19, w0, w1           // Scale

        adr     x0, minutes           // Ask for minutes
        bl      write_str
        bl      get_uint              // Minutes
        mov     w1, 60                // 60 seconds per minute
        mul     w0, w0, w1            // Scale
        add     w19, w19, w0          // Add scaled minutes

        adr     x0, seconds           // Ask for seconds
        bl      write_str
        bl      get_uint              // Seconds
        add     w0, w19, w0           // Add seconds

        ldr     x19, [sp, save19]     // Restore for caller
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret                           // Back to caller
