// Allocate an int array, store (2 * element number)
// in each element, and print array contents.
        .arch armv8-a
// Useful constant
        .equ    N, 10                   // Array length
// Stack frame
        .equ    my_array, 16
        .equ    FRAME, 64
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]!   // Create stack frame
        mov     fp, sp                  // Set our frame pointer

        mov     w1, N                   // Length of array
        add     x0, sp, my_array        // Address of array
        bl      twice_index             // Fill the array

        mov     w1, N                   // Number of elements
        add     x0, sp, my_array        // Address of array
        bl      display_array           // Print array contents

        mov     w0, wzr                 // Return 0
        ldp     fp, lr, [sp], FRAME     // Delete stack frame
        ret
