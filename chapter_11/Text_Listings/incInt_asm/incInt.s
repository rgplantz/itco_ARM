// incInt.s
// Increments an integer.
        .arch armv8-a
// Stack frame
        .equ    x, 28
        .equ    frameSize, 32
// Constants 
        .section        .rodata
prompt:
        .string "Enter an integer: "
inputFormat:
        .string "%i"
result:
        .string "Result: %i\n"
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, frameSize]!  // our stack frame
        mov     fp, sp
        adrp    x0, prompt                // prompt user
        add     x0, x0, :lo12:prompt
        bl      printf
        add     x1, sp, x                 // address for input
        adrp    x0, inputFormat           // scanf format string
        add     x0, x0, :lo12:inputFormat
        bl      scanf
        ldr     w0, [sp, x]               // get x
        add     w1, w0, 1                 // add one
        str     w1, [sp, x]               // x++;
        adrp    x0, result                // address of format string
        add     x0, x0, :lo12:result
        bl      printf
        mov     w0, wzr
        ldp     fp, lr, [sp], frameSize // undo stack frame
        ret
