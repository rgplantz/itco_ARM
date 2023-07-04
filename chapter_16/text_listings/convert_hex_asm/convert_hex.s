// Gets hex number from user and stores it as an int
        .arch armv8-a
// Useful constant
        .equ    MAX, 8
// Stack frame
        .equ    the_int, 16
        .equ    the_string, 20
        .equ    frame, 32
// Code
        .text
        .section  .rodata
        .align  3
prompt:
        .string "Enter up to 8 hex characters: "
format:
        .string "0x%x = %i\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frame]! // create stack frame
        mov     fp, sp                // our frame pointer

        adr     x0, prompt            // prompt message
        bl      write_str              // ask for input

        mov     w1, MAX               // limit number of input chars
        add     x0, sp, the_string     // place to store string
        bl      read_str               // get from keyboard

        add     x1, sp, the_string     // address of string
        add     x0, sp, the_int        // place to store int
        bl      hex_to_int              // do conversion

        ldr     w2, [sp, the_int]      // load int
        ldr     w1, [sp, the_int]      // printf shows this copy in hex
        adr     x0, format            // format string
        bl      printf

        mov     w0, 0                 // return 0;
        ldp     x29, x30, [sp], frame // undo stack frame
        ret
