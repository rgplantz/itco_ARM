// convertDec.s
// Reads decimal number from keyboad and displays how
// it's stored in hexadecimal.
        .arch armv8-a
// Useful constant
        .equ    MAX,12                    // character storage limit
// Stack frame
        .equ    theInt,16
        .equ    theString,20
        .equ    frameSize,32
// Code
        .text
        .section        .rodata
        .align  3
prompt:
        .string "Enter an unsigned integer: "
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
        adrp    x0, prompt                // page of prompt message
        add     x0, x0, :lo12:prompt      // plus offset in page
        bl      writeStr                  // ask for input

        add     x0, sp, theString         // place to store string
        mov     w1, MAX                   // limit number of input chars
        bl      readLn                    // get from keyboard

        add     x1, sp, theString         // address of string
        add     x0, sp, theInt            // place to store the int
        bl      decToUInt                 // do conversion

        ldr     w2, [sp, theInt]          // load the int
        add     x1, sp, theString         // input text string
        adrp    x0, format                // page of prompt message
        add     x0, x0, :lo12:format      // plus offset in page
        bl      printf                    // show results
        mov     w0, 0                     // return 0;
        ldp     x29, x30, [sp], frameSize // undo stack frame
        ret
