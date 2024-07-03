// Display a length to the nearest sixteenth.
        .arch armv8-a
// Calling sequence
//    w0[31-4] <- integer part
//    w0[3-0]  <- fractional part
//    Return 0.
// Useful constants
        .equ    FOUR_BITS, 0xf        // For fraction
// Stack frame
        .equ    save19, 16
        .equ    FRAME, 32
# Constant data
        .section  .rodata
        .align  3
sixteenths:
        .string "/16"
// Code
        .text
        .align  2
        .global display_length
        .type   display_length, %function
display_length:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        str     x19, [sp, save19]     // For local var

        mov     w19, w0               // Save input.
        lsr     w0, w19, 4            // Integer part
        bl      put_uint

        mov     w0, ' '               // Some formatting
        bl      write_char

        and     w0, w19, FOUR_BITS    // Mask off integer
        bl      put_uint              // Fractional part

        adr     x0, sixteenths        // More formatting
        bl      write_str

        mov     w0, wzr               // Return 0
        ldr     x19, [sp, save19]     // Restore for caller
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret                           // Back to caller
