// .ssum11ints.s
// Sums the integers 1 - 11.
        .arch armv8-a
// Stack frame
        .equ    arg9, 0
        .equ    arg10, 8
        .equ    arg11, 16
        .equ    frameRec, 32
        .equ    total, 48
        .equ    k, 52
        .equ    j, 56
        .equ    i, 60
        .equ    h, 64
        .equ    g, 68
        .equ    f, 72
        .equ    e, 76
        .equ    d, 80
        .equ    c, 84
        .equ    b, 88
        .equ    a, 92
        .equ    frame, 96
// Constant data
        .section        .rodata
        .align  3
format:
        .string "The sum is %i\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        sub     sp, sp, frame         // allocate our stack frame
        stp     fp, lr, [sp, frameRec]  // create frame record
        add     fp, sp, frameRec      // set our frame pointer
        mov     w0, 1                 // store values in local vars.
        str     w0, [sp, a]
        mov     w0, 2
        str     w0, [sp, b]
        mov     w0, 3
        str     w0, [sp, c]
        mov     w0, 4
        str     w0, [sp, d]
        mov     w0, 5
        str     w0, [sp, e]
        mov     w0, 6
        str     w0, [sp, f]
        mov     w0, 7
        str     w0, [sp, g]
        mov     w0, 8
        str     w0, [sp, h]
        mov     w0, 9
        str     w0, [sp, i]
        mov     w0, 10
        str     w0, [sp, j]
        mov     w0, 11
        str     w0, [sp, k]
        ldr     w0, [sp, k]           // store args 9 - 11
        str     w0, [sp, arg11]       //      on stack
        ldr     w0, [sp, j]
        str     w0, [sp, arg10]
        ldr     w0, [sp, i]
        str     w0, [sp, arg9]
        ldr     w7, [sp, h]           // load args 1 - 8
        ldr     w6, [sp, g]           //      in regs. 0 - 7
        ldr     w5, [sp, f]
        ldr     w4, [sp, e]
        ldr     w3, [sp, d]
        ldr     w2, [sp, c]
        ldr     w1, [sp, b]
        ldr     w0, [sp, a]
        bl      addEleven             // add all
        str     w0, [sp, total]       // store returned sum
        ldr     w1, [sp, total]       // argument to printf
        adr     x0, format            // format string 
        bl      printf                // print result
        mov     w0, wzr               // return 0;

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp, frameRec]  // restore fp, lr, sp
        add     sp, sp, frame         // deallocate our stack frame
        ret                           // back to caller
