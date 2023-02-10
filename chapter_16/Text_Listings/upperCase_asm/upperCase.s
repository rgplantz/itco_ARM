// Converts alphabetic characters to uppercase
        .arch armv8-a
// Useful constant
        .equ    MAX,50                    // character storage limit
// Stack frame
        .equ    theString, 16
        .equ    frameSize, 80
// Code
        .text
        .section        .rodata
        .align  3
prompt:
        .string "Enter up to 50 alphabetic characters: "
result:
        .string "All upper: "
newline:
        .string "\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frameSize]! // create stack frame
        mov     fp, sp                    // our frame pointer
        adr     x0, prompt                // prompt message
        bl      writeStr                  // ask for input

        add     x0, sp, theString         // place to store string
        mov     w1, MAX                   // limit number of input chars
        bl      readLn                    // get from keyboard

        add     x1, sp, theString         // address of string
        mov     x0, x1                    // replace it
        bl      toUpper                   // do conversion

        adr     x0, result                // show result
        bl      writeStr
        add     x0, sp, theString         // converted string
        bl      writeStr
        adr     x0, newline               // nice formatting
        bl      writeStr

        mov     w0, 0                     // return 0;
        ldp     x29, x30, [sp], frameSize // undo stack frame
        ret
