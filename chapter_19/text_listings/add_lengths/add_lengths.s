// Adds 2 lengthx, fixed-point to nearest sixteenth
        .arch armv8-a
// Stack frame
        .equ    x, 16
        .equ    y, 20
        .equ    frame, 32
// Constant data
        .section	.rodata
        .align  3
sum_msg:
        .string "Sum = "
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        bl      get_length
        str     w0, [sp, x]           // first number
        bl      get_length
        str     w0, [sp, y]           // second number

        adr     x0, sum_msg           // some formatting
        bl      write_str
        ldr     w0, [sp, x]           // add x and y
        ldr     w1, [sp, y]
        add     w0, w0, w1
        bl      display_length        // show result
        mov     w0, '\n'              // finish formatting
        bl      write_char

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
