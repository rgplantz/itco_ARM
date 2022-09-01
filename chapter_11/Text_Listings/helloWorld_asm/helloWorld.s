// helloWorld.s
// Hello, World! program
        .arch armv8-a
// Useful constant
        .equ    STDOUT,1
// Stack frame
        .equ    frameSize,16
        .text
        .section        .rodata
        .align  3
message:
        .string "Hello, World!\n"
        .equ    msgLength,.-message
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frameSize]! // create our stack frame
        mov     fp, sp                    // set our frame pointer
        mov     x2, msgLength             // number of characters
        adrp    x0, message               // address of page
        add     x1, x0, :lo12:message     // plus offset in page
        mov     w0, STDOUT                // standard out file no.
        bl      write
        mov     w0, 0                     // return value
        ldp     fp, lr, [sp], frameSize   // undo our stack frame
        ret
