// Gets hex number from user and stores it as long int
        .arch armv8-a
// Useful constant
        .equ    MAX, 17               // character storage limit
// Stack frame
        .equ    theInt, 16
        .equ    theString, 24
        .equ    frame, 48
// Code
        .text
        .section  .rodata
        .align  3
prompt:
        .string "Enter up to 16 hex characters: "
format:
        .string "%lx = %li\n"
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
        bl      readLn                // get from keyboard

        add     x1, sp, theString     // address of string
        add     x1, sp, theInt        //    and the long int
        bl      hexToInt              // do conversion

        ldr     x1, [sp, theInt]      // load long int
        adr     x0, format            // format string
        bl      printf

        mov     w0, 0                 // return 0;
        ldp     x29, x30, [sp], frame // undo stack frame
        ret
