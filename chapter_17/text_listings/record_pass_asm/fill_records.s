// Allocate two records, assign a value to each field
// in each record, and display the contents.
        .arch armv8-a
// Stack frame
        .equ    x, 16
        .equ    y, 32
        .equ    FRAME, 48
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]!   // Create stack frame
        mov     fp, sp                  // Set our frame pointer

        mov     w5, 'c'                 // Data to load
        mov     w4, 34
        mov     w3, 'b'
        mov     w2, 12
        mov     w1, 'a' 
        add     x0, sp, x               // Address of first record
        bl      load_record             // Load values

        mov     w5, 'f'                 // Data to load
        mov     w4, 78
        mov     w3, 'e'
        mov     w2, 56
        mov     w1, 'd' 
        add     x0, sp, y               // Address of second record
        bl      load_record             // Load values

        ldr     x0, [sp, x]             // First 8 bytes of x
        ldr     w1, [sp, x+8]           // Last 4 bytes of x
        bl      display_record          // Display x

        ldr     x0, [sp, y]             // First 8 bytes of y
        ldr     w1, [sp, y+8]           // Last 4 bytes of y
        bl      display_record          // Display y

        mov     w0, wzr                 // Return 0
        ldp     fp, lr, [sp], FRAME     // Delete stack frame
        ret
