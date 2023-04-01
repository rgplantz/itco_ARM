// Gets decimal number from user and stores it as unsigned int
        .arch armv8-a
// Useful constant
        .equ    MAX, 11                   // character storage limit
// Stack frame
        .equ    theInt, 16
        .equ    theString, 20
        .equ    frameSize, 32
// Code
        .text
        .section        .rodata
        .align  3
prompt:
        .string "Enter an integer: "
        .align  3
format:
        .string "\"%s\" is stored as 0x%x\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frameSize]! // create stack frame
        mov     fp, sp                    // our frame pointer
        adr     x0, prompt                // prompt message
        bl      writeStr                  // ask for input

        mov     w1, MAX                   // limit number of input chars
        add     x0, sp, theString         // place to store string
        bl      readStr                    // get from keyboard

        add     x1, sp, theString         // address of string
        add     x0, sp, theInt            // place to store the int
        bl      decToInt                 // do conversion

        ldr     w2, [sp, theInt]          // load the int
        add     x1, sp, theString         // input text string
        adr     x0, format                // format message
        bl      printf                    // show results
        mov     w0, 0                     // return 0;
        ldp     x29, x30, [sp], frameSize // undo stack frame
        ret
