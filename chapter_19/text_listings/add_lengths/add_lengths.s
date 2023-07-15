// Adds 2 lengths, fixed-point to nearest sixteenth
        .arch armv8-a
// Stack frame
        .equ    save1920, 16
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
        stp     x19, x20, [sp, save1920]  // for local vars

        bl      get_length
        mov     w19, w0               // first number
        bl      get_length
        mov     w20, w0               // second number

        adr     x0, sum_msg           // some formatting
        bl      write_str
        add     w0, w20, w19          // add lengths
        bl      display_length        // show result
        mov     w0, '\n'              // finish formatting
        bl      write_char

        mov     w0, wzr               // return 0;
        ldp     x19, x20, [sp, save1920]  // restore for caller
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
