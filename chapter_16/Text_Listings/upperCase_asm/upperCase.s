// Converts alphabetic characters to uppercase
        .arch armv8-a
// Useful constant
        .equ    MAX,50                // character limit
// Stack frame
        .equ    theString, 16
        .equ    frame, 80             // allows >51 bytes
// Code
        .text
        .section        .rodata
        .align  3
prompt:
        .string "Enter up to 50 alphabetic characters: "
result:
        .string "All upper: "
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frame]! // create stack frame
        mov     fp, sp                // our frame pointer
        adr     x0, prompt            // prompt message
        bl      writeStr              // ask for input

        add     x0, sp, theString     // place to store string
        mov     w1, MAX               // limit number of input chars
        bl      readStr               // get from keyboard

        add     x1, sp, theString     // address of string
        mov     x0, x1                // replace it
        bl      toUpper               // do conversion

        adr     x0, result            // message
        bl      writeStr
        add     x0, sp, theString     // converted string
        bl      writeStr
        mov     w0, '\n'              // nice formatting
        bl      writeChar

        mov     w0, 0                 // return 0;
        ldp     x29, x30, [sp], frame // undo stack frame
        ret
