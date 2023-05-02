// Displays fields of aRecord.s
//    x0 <- first 8 bytes of record contents
//    w1 <- remaining 4 bytes of record contents
        .arch armv8-a
        .include  "aRecord.s"         // field offsets
// Stack frame
        .equ    save19, 16
        .equ    record, 24
        .equ    frame, 48
// Code
        .section        .rodata
        .align  3
msg1:
        .string "intArray["
msg2:
        .string "] = "
newline:
        .string "\n"
        .text
        .align  2
        .global displayRecord
        .type   displayRecord, %function
displayRecord:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set frame pointer
        str     x19, [sp, save19]     // save reg

        str     x0, [sp, record]      // make copy of record
        str     w1, [sp, record+8]
        add     x19, sp, record       // point to our copy

        ldrb    w0, [x19, a]          // first char
        bl      putChar               // display
        mov     w0, ' '               // space
        bl      putChar
        ldr     w0, [x19, i]          // first int
        bl      putInt                // display
        mov     w0, ' '               // space
        bl      putChar
        ldrb    w0, [x19, b]          // second char
        bl      putChar               // display
        mov     w0, ' '               // space
        bl      putChar
        ldr     w0, [x19, j]          // second int
        bl      putInt                // display
        mov     w0, ' '               // space
        bl      putChar
        ldrb    w0, [x19, c]          // third char
        bl      putChar               // display
        mov     w0, ' '               // space
        bl      putChar
        mov     w0, '\n'              // newline
        bl      putChar

        mov     w0, wzr               // return 0;
        ldr     x19, [sp, save19]     // restore reg
        ldp     fp, lr, [sp], frame   // undo stack frame
        ret
