// Add two time values.
        .arch armv8-a
// Stack frame
        .equ    save1920, 16
        .equ    FRAME, 32
// Constant data
        .section  .rodata
        .align  3
start_time:
        .string "Starting time\n"
delta_time:
        .string "Duration time\n"
end_time:
        .string "Ends at "
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]!     // Create stack frame
        mov     fp, sp                    // Set our frame pointer
        stp     x19, x20, [sp, save1920]  // For local vars

        adr     x0, start_time            // Ask for starting time
        bl      write_str
        bl      get_time
        mov     w19, w0                   // Start time
        adr     x0, delta_time            // Ask for duration time
        bl      write_str
        bl      get_time
        mov     w20, w0                   // Delta time

        adr     x0, end_time              // Ending message
        bl      write_str
        add     w0, w19, w20              // Add values
        bl      display_time              // Show ending time
        mov     w0, '\n'                  // Finish formatting
        bl      write_char

        mov     w0, wzr                   // Return 0
        ldp     x19, x20, [sp, save1920]  // Restore for caller
        ldp     fp, lr, [sp], FRAME       // Delete stack frame
        ret                               // Back to caller
