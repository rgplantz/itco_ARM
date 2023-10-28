// Allocates an int array, stores 2 X element number
// in each element and prints array contents
        .arch armv8-a
// Useful constant
        .equ    N, 10                   // array length
// Stack frame
        .equ    an_array, 16
        .equ    FRAME, 64
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]!   // create our stack frame
        mov     fp, sp                  // Set frame pointer

        mov     w1, N                   // length of array
        add     x0, sp, an_array        // address of array
        bl      twiceIndex              // fill the array

        mov     w1, N                   // number of elements
        add     x0, sp, an_array        // address of array
        bl      display_array           // print array contents

        mov     w0, wzr                 // return 0;
        ldp     fp, lr, [sp], FRAME     // undo stack frame
        ret
