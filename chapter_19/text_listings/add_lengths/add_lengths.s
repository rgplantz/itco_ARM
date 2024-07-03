// Add 2 lengths, fixed-point, to nearest sixteenth.
        .arch armv8-a
// Stack frame
        .equ    save1920, 16
        .equ    FRAME, 32
// Constant data
        .section  .rodata
        .align  3
sum_msg:
        .string "Sum = "
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]!     // Create stack frame
        mov     fp, sp                    // Set our frame pointer
        stp     x19, x20, [sp, save1920]  // For local vars

        bl      get_length
        mov     w19, w0                   // First number
        bl      get_length
        mov     w20, w0                   // Second number

        adr     x0, sum_msg               // Some formatting
        bl      write_str
        add     w0, w20, w19              // Add lengths
        bl      display_length            // Show result
        mov     w0, '\n'                  // Finish formatting
        bl      write_char

        mov     w0, wzr                   // Return 0
        ldp     x19, x20, [sp, save1920]  // Restore for caller
        ldp     fp, lr, [sp], FRAME       // Delete stack frame
        ret                               // Back to caller
