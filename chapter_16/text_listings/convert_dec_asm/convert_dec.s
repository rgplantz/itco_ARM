// Gets decimal number from user and stores it as an int
        .arch armv8-a
// Useful constant
        .equ    MAX, 11               // character storage limit
// Stack frame
        .equ    the_int, 16
        .equ    the_string, 20
        .equ    frame, 32
// Code
        .text
        .section  .rodata
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
        stp     fp, lr, [sp, -frame]! // create stack frame
        mov     fp, sp                // our frame pointer
        adr     x0, prompt            // prompt message
        bl      write_str             // ask for input

        mov     w1, MAX               // limit number of input chars
        add     x0, sp, the_string    // place to store string
        bl      read_str              // get from keyboard

        add     x1, sp, the_string    // address of string
        add     x0, sp, the_int       // place to store the int
        bl      dec_to_int            // do conversion

        ldr     w2, [sp, the_int]     // load the int
        add     x1, sp, the_string    // input text string
        adr     x0, format            // format message
        bl      printf                // show results
        mov     w0, wzr               // return 0;
        ldp     x29, x30, [sp], frame // undo stack frame
        ret
