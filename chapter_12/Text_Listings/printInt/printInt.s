// printInt.s
// Prints an integer.
        .arch armv8-a
// Stack frame
        .equ    x, 28
        .equ    frame, 32
// Constants 
        .section        .rodata
result:
        .string "x = 0x%x\n"
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, frame]!  // our stack frame
        mov     fp, sp

        mov     w0, 0x1234            // a constant
        str     w0, [sp, x]

        ldr     w21, [sp, x]          // get x
        mov     w1, w21               // second argument
        add     w1, w21, 0            // another way
        adrp    x0, result            // page of format string
        add     x0, x0, :lo12:result  // plus offset in page
        adr     x0, result            // show other way
        bl      printf

        mov     w0, wzr
        ldp     fp, lr, [sp], frame   // undo stack frame
        ret
