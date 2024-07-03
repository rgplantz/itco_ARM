// Get a length in inches and 1/16s.
// Calling sequence
//     Return the fixed-point number.
        .arch armv8-a
// Stack frame
        .equ    save19, 16
        .equ    FRAME, 32
# Constant data
        .section  .rodata
        .align  3
prompt:
        .string "Enter length (inches and 1/16s)\n"
inches:
        .string "        Inches: "
fraction:
        .string "    Sixteenths: "
// Code
        .text
        .align  2
        .global get_length
        .type   get_length, %function
get_length:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        str     x19, [sp, save19]     // For local var

        adr     x0, prompt            // Ask for length
        bl      write_str
        adr     x0, inches            // Ask for integer
        bl      write_str
        bl      get_uint              // Integer part
        lsl     w19, w0, 4            // 4 bits for fraction

        adr     x0, fraction          // Ask for fraction
        bl      write_str
        bl      get_uint              // Fractional part
        add     w0, w0, w19           // Add integer part

        ldr     x19, [sp, save19]     // Restore for caller
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret                           // Back to caller
