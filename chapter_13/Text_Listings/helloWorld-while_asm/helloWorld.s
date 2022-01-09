// helloWorld.s
// Writes Hello, World! one character at a time
        .arch armv8-a
// Useful constants
        .equ    NUL,wzr                   // use zero register
        .equ    STDOUT,1
// Stack frame
        .equ    frameSize,16
// Code
        .text
        .section        .rodata
        .align  3
message:
        .string "Hello, World!\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frameSize]! // create our stack frame
        mov     fp, sp                    // set our frame pointer
        mov     x2, promptLength          // number of characters
        adrp    x0, message               // address of page
        add     x19, x0, :lo12:message    // plus offset in page
whileLoop:
        ldrb    w0, [x19]                 // load character
        cmp     w0, NUL                   // end of string?
        beq     allDone                   // yes
        mov     w2, STDOUT                // no, one char
        mov     x1, x19                   // address of char
        mov     x0, STDOUT                // write on screen
        bl      write
        add     x19, x19, 1               // increment pointer
        b       whileLoop                 // and continue
allDone:
        mov     w0, 0                     // return value
        ldp     fp, lr, [sp], frameSize   // undo our stack frame
        ret
