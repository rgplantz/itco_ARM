// echoChar.s
// Echos characters typed on keyboard
        .arch armv8-a
// Useful constants
        .equ    STDIN,0
        .equ    STDOUT,1
// Stack frame
        .equ    aChar,31
        .equ    frameSize,32
// Code
        .text
        .section        .rodata
        .align  3
prompt:
        .string "Enter one character: "
        .equ    promptLength,.-prompt
message:
        .string "You entered: "
        .equ    msgLength,.-message
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frameSize]! // create our stack frame
        mov     fp, sp                    // set our frame pointer
        mov     x2, promptLength          // number of characters
        adrp    x0, prompt                // address of page
        add     x1, x0, :lo12:prompt      // plus offset in page
        mov     w0, STDOUT                // standard out file no.
        bl      write

        mov     x2, 1                     // one character
        add     x1, sp, aChar             // place to store it
        mov     x0, STDIN                 // read keyboard
        bl      read

        mov     x2, msgLength             // number of characters
        adrp    x0, message               // address of page
        add     x1, x0, :lo12:message     // plus offset in page
        mov     w0, STDOUT                // standard out file no.
        bl      write

        mov     x2, 1                     // one character
        add     x1, sp, aChar             // place it's stored
        mov     x0, STDOUT                // write on screen
        bl      write

        mov     w0, 0                     // return value
        ldp     fp, lr, [sp], frameSize   // undo our stack frame
        ret
