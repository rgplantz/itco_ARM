// Get a decimal number from the user and store it as an int.
        .arch armv8-a
// Useful constant
        .equ    MAX, 12               // Character storage limit
// Stack frame
        .equ    the_int, 16
        .equ    the_string, 20
        .equ    FRAME, 32
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
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Our frame pointer
        adr     x0, prompt            // Prompt message
        bl      write_str             // Ask for input

        mov     w1, MAX               // Limit number of input chars
        add     x0, sp, the_string    // Place to store string
        bl      read_str              // Get from keyboard

        add     x1, sp, the_string    // Address of string
        add     x0, sp, the_int       // Place to store the int
        bl      dec_to_int            // Do conversion

        ldr     w2, [sp, the_int]     // Load the int
        add     x1, sp, the_string    // Input text string
        adr     x0, format            // Format message
        bl      printf                // Show results
        mov     w0, wzr               // Return 0
        ldp     x29, x30, [sp], FRAME // Delete stack frame
        ret
