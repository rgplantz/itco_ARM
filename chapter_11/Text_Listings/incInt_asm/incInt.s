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
        stp     x29, x30, [sp, frameSize]! // our stack frame
        mov     x29, sp
        adrp    x0, prompt    // prompt user
        add     x0, x0, :lo12:prompt
        bl      printf
        add     x1, sp, x       // address for input
        adrp    x0, inputFormat // scanf format string
        add     x0, x0, :lo12:inputFormat
        bl      __isoc99_scanf
        ldr     w0, [sp, x]   // get x
        add     w0, w0, 1     // add one
        str     w0, [sp, x]   // x++;
        adrp    x0, result    // address of format string
        add     x0, x0, :lo12:result
        bl      printf
        mov     w0, wzr
        ldp     x29, x30, [sp], frameSize // undo stack frame
        ret
        .size   main, .-main
        .ident  "GCC: (Debian 10.2.1-6) 10.2.1 20210110"
        .section        .note.GNU-stack,"",@progbits
