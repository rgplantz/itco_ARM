// Displays fields of my_record.s
//    x0 <- first 8 bytes of record contents
//    w1 <- remaining 4 bytes of record contents
        .arch armv8-a
        .include  "my_record.s"      // field offsets
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
        stp     fp, lr, [sp, -FRAME]! // create our stack frame
        mov     fp, sp                // set frame pointer
        str     x19, [sp, save19]     // save reg

        add     x19, sp, record       // point to our copy
        str     x0, [x19]             // make a copy of record
        str     w1, [x19, 8]

        ldrb    w0, [x19, a]          // first char
        bl      write_char            // display
        adr     x0, separator         // field separation
        bl      write_str
        ldr     w0, [x19, i]          // first int
        bl      put_int               // display
        adr     x0, separator         // field separation
        bl      write_str
        ldrb    w0, [x19, b]          // second char
        bl      write_char            // display
        adr     x0, separator         // field separation
        bl      write_str
        ldr     w0, [x19, j]          // second int
        bl      put_int               // display
        adr     x0, separator         // field separation
        bl      write_str
        ldrb    w0, [x19, c]          // third char
        bl      write_char            // display
        mov     w0, '\n'              // newline
        bl      write_char

        mov     w0, wzr               // return 0;
        ldr     x19, [sp, save19]     // restore reg
        ldp     fp, lr, [sp], FRAME   // undo stack frame
        ret
