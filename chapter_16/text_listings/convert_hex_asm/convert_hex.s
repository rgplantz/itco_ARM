// Get a hex number from the user and store it as an int.
        .arch armv8-a
// Useful constant
        .equ    MAX, 8
// Stack frame
        .equ    the_int, 16
        .equ    the_string, 20
        .equ    FRAME, 32
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
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Our frame pointer

        adr     x0, prompt            // Prompt message
        bl      write_str             // Ask for input

        add     x0, sp, the_string    // Place to store string
        mov     w1, MAX               // Limit number of input chars
        bl      read_str              // Get from keyboard

        add     x1, sp, the_string    // Address of string
        add     x0, sp, the_int       // Place to store int
        bl      hex_to_int            // Do conversion

        ldr     w2, [sp, the_int]     // Load int
        ldr     w1, [sp, the_int]     // printf shows this copy in hex
        adr     x0, format            // Format string
        bl      printf

        mov     w0, 0                 // Return 0
        ldp     x29, x30, [sp], FRAME // Delete stack frame
        ret
