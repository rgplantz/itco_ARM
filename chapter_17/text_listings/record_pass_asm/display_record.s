// Display the fields of my_record.s.
//    x0 <- first 8 bytes of record contents
//    w1 <- remaining 4 bytes of record contents
        .arch armv8-a
        .include  "my_record.s"      // Field offsets
// Stack frame
        .equ    save19, 16
        .equ    record, 24
        .equ    FRAME, 48
// Code
        .section  .rodata
        .align  3
separator:
        .string ", "
        .text
        .align  2
        .global display_record
        .type   display_record, %function
display_record:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        str     x19, [sp, save19]     // Save reg

        add     x19, sp, record       // Point to our copy
        str     x0, [x19]             // Make a copy of record
        str     w1, [x19, 8]

        ldrb    w0, [x19, a]          // First char
        bl      write_char            // Display
        adr     x0, separator         // Field separation
        bl      write_str
        ldr     w0, [x19, i]          // First int
        bl      put_int               // Display
        adr     x0, separator         // Field separation
        bl      write_str
        ldrb    w0, [x19, b]          // Second char
        bl      write_char            // Display
        adr     x0, separator         // Field separation
        bl      write_str
        ldr     w0, [x19, j]          // Second int
        bl      put_int               // Display
        adr     x0, separator         // Field separation
        bl      write_str
        ldrb    w0, [x19, c]          // Third char
        bl      write_char            // Display
        mov     w0, '\n'              // Newline
        bl      write_char

        mov     w0, wzr               // Return 0
        ldr     x19, [sp, save19]     // Restore reg
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret
