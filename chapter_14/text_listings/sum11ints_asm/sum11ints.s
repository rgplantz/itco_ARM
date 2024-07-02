// Sum the integers 1 to 11.
        .arch armv8-a
// Stack frame
        .equ    arg9, 0
        .equ    arg10, 8
        .equ    arg11, 12
        .equ    frame_record, 32
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
        .equ    FRAME, 96
// Constant data
        .section  .rodata
        .align  3
format:
        .string "The sum is %i\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        sub     sp, sp, FRAME              // Allocate our stack frame
        stp     fp, lr, [sp, frame_record] // Create frame record
        add     fp, sp, frame_record       // Set our frame pointer
        mov     w0, 1                      // Store values in local vars
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
        ldr     w0, [sp, k]                // Store args 9-11
        str     w0, [sp, arg11]            //   on the stack.
        ldr     w0, [sp, j]
        str     w0, [sp, arg10]
        ldr     w0, [sp, i]
        str     w0, [sp, arg9]
        ldr     w7, [sp, h]                // Load args 1-8
        ldr     w6, [sp, g]                //   in regs 0-7.
        ldr     w5, [sp, f]
        ldr     w4, [sp, e]
        ldr     w3, [sp, d]
        ldr     w2, [sp, c]
        ldr     w1, [sp, b]
        ldr     w0, [sp, a]
        bl      add_eleven                 // Add all
        str     w0, [sp, total]            // Store returned sum
        ldr     w1, [sp, total]            // Argument to printf
        adr     x0, format                 // Format string 
        bl      printf                     // Print result

        mov     w0, wzr                    // Return 0
        ldp     fp, lr, [sp, frame_record] // Restore fp and lr
        add     sp, sp, FRAME              // Delete stack frame
        ret                                // Back to caller
