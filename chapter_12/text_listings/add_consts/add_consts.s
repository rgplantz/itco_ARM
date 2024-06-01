// Add three constants to show some machine code.
        .arch armv8-a
// Stack frame
        .equ    z, 28
        .equ    FRAME, 32
// Constants 
        .section  .rodata
format:
        .string "%i + %i + 456 = %i\n"
// Code
        .text
        .align	2
        .global	main
        .type	main, %function
main:
        stp     fp, lr, [sp, FRAME]!  // Our stack frame
        mov     fp, sp

        mov     w19, 123              // First constant
        mov     w20, -123             // Second constant
        add     w21, w19, w20         // Add them.
        add     w22, w21, 456         // Another constant
        str     w22, [sp, z]          // Store sum.

        ldr     w3, [sp, z]           // Get sum.
        mov     w2, w20               // Get 2nd constant.
        orr     w2, wzr, w20          // Alias
        mov     w1, w19               // Get 1st constant.
        adr     x0, format            // Assume on same page.
        bl      printf

        mov     w0, wzr               // Return 0.
        ldp     fp, lr, [sp], FRAME   // Undo stack FRAME.
        ret
