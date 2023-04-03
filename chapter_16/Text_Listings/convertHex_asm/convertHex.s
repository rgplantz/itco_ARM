// Gets hex number from user and stores it as int
        .arch armv8-a
// Useful constant
        .equ    MAX, 16
// Stack frame
        .equ    theInt, 16
        .equ    theString, 32
        .equ    frame, 64
// Code
        .text
        .section  .rodata
        .align  3
prompt:
        .string "Enter up to 16 hex characters: "
format:
        .string "0x%x = %li\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frame]! // create stack frame
        mov     fp, sp                // our frame pointer

        adr     x0, prompt            // prompt message
        bl      writeStr              // ask for input

        mov     w1, MAX               // limit number of input chars
        add     x0, sp, theString     // place to store string
        bl      readStr               // get from keyboard

        add     x1, sp, theInt        // place to store int
        add     x0, sp, theString     // address of string
        bl      hexToInt              // do conversion

        ldr     x2, [sp, theInt]      // load int
        ldr     x1, [sp, theInt]      // printf shows this copy in hex
        adr     x0, format            // format string
        bl      printf

        mov     w0, 0                 // return 0;
        ldp     x29, x30, [sp], frame // undo stack frame
        ret
