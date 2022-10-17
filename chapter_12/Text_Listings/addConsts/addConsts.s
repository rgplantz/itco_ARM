// addConsts.s
// Adds two constants to show some machine code.
        .arch armv8-a
// Stack frame
        .equ    z, 28
        .equ    frame, 32
// Constants 
        .section        .rodata
format:
        .string "%i + %i = %i\n"
// Code
        .text
        .align	2
        .global	main
        .type	main, %function
main:
        stp     fp, lr, [sp, frame]!  // our stack frame
        mov     fp, sp

        mov     w19, 123              // first constant
        mov     w20, -123             // second constant
        add     w21, w19, w20         // add them
        str     w22, [sp, z]          // store sum

        ldr     w3, [sp, z]           // get sum
        mov     w2, w20               // get 2nd constant
        orr     w2, wzr, w20          // alias
        mov     w1, w19               // get 1st constant
        adrp    x0, format            // format string page
        add     x0, x0, :lo12:format  // offset in page
        adr     x0, format            // assume on same page
        bl      printf

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp], frame   // undo stack frame
        ret
