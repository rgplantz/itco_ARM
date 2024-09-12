// Get an ocatal number from the user and store it as a long int.
        .arch armv8-a
// Useful constant
        .equ    MAX, 21
// Stack frame
        .equ    the_int, 16
        .equ    the_string, 24
        .equ    FRAME, 48
// Code
        .text
        .section  .rodata
        .align  3
prompt:
        .string "Enter up to 21 octal characters: "
format:
        .string "0%o = %i\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Our frame pointer

        adr     x0, prompt            // Prompt message
        bl      write_str             // Ask for input

        add     x0, sp, the_string    // Place to store string
        mov     w1, MAX               // Limit number of input chars
        bl      read_str              // Get from keyboard

        add     x1, sp, the_string    // Address of string
        add     x0, sp, the_int       // Place to store int
        bl      octal_to_int          // Do conversion

        ldr     w2, [sp, the_int]     // Load int
        ldr     w1, [sp, the_int]     // printf shows this copy in hex
        adr     x0, format            // Format string
        bl      printf

        mov     w0, 0                 // Return 0
        ldp     x29, x30, [sp], FRAME // Delete stack frame
        ret
