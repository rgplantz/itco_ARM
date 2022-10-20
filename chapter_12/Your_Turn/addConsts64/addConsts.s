// addConsts.s
// Adds three constants to show some machine code.
        .arch armv8-a
// Stack frame
        .equ    z, 24
        .equ    frame, 32
// Constants 
        .section        .rodata
format:
        .string "%li + %li + 456 = %li\n"
// Code
        .text
        .align	2
        .global	main
        .type	main, %function
main:
        stp     fp, lr, [sp, frame]!  // our stack frame
        mov     fp, sp

        mov     x19, 65537            // first constant
        mov     x20, -65538           // second constant
        add     x21, x19, x20         // add them
        add     x22, x21, 456         // another constant
        str     x22, [sp, z]          // store sum

        ldr     x3, [sp, z]           // get sum
        mov     x2, x20               // get 2nd constant
        orr     x2, xzr, x20          // alias
        mov     x1, x19               // get 1st constant
        adr     x0, format            // assume on same page
        bl      printf

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp], frame   // undo stack frame
        ret
