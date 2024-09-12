// Make an alphabetic text string opposite case.
        .arch armv8-a
// Useful constant
        .equ    MAX,50                    // Character limit
// Stack frame
        .equ    the_string, 16
        .equ    FRAME, 80                 // Allows >51 bytes
// Code
        .text
        .section  .rodata
        .align  3
prompt:
        .string "Enter up to 50 alphabetic characters: "
result:
        .string "All lower: "
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        adr     x0, prompt            // Prompt message
        bl      write_str             // Ask for input

        add     x0, sp, the_string    // Place to store string
        mov     w1, MAX               // Limit number of input chars
        bl      read_str              // Get from keyboard

        add     x1, sp, the_string    // Address of string
        mov     x0, x1                // Replace the string.
        bl      toggle_case           // Do conversion

        adr     x0, result            // Show result
        bl      write_str
        add     x0, sp, the_string    // Converted string
        bl      write_str
        mov     w0, '\n'              // Nice formatting
        bl      write_char

        mov     w0, 0                 // Return 0
        ldp     x29, x30, [sp], FRAME // Delete stack frame
        ret
