// Makes alphabetic text string all uppercase
        .arch armv8-a
// Useful constant
        .equ    MAX,50                // character limit
// Stack frame
        .equ    my_string, 16
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
        bl      write_str             // ask for input

        add     x0, sp, my_string     // place to store string
        mov     w1, MAX               // limit number of input chars
        bl      read_str              // get from keyboard

        add     x1, sp, my_string     // address of string
        mov     x0, x1                // replace it
        bl      to_upper              // do conversion

        adr     x0, result            // message
        bl      write_str
        add     x0, sp, my_string     // converted string
        bl      write_str
        mov     w0, '\n'              // nice formatting
        bl      write_char

        mov     w0, 0                 // return 0;
        ldp     x29, x30, [sp], frame // undo stack frame
        ret
