// Allocates two records, assigns a value to each field
// in each record, and displays the contents.
        .arch armv8-a
// Stack frame
        .equ    x, 16
        .equ    y, 32
        .equ    FRAME, 48
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]!   // create our stack frame
        mov     fp, sp                  // Set frame pointer

        mov     w5, 'c'                 // data to load
        mov     w4, 34
        mov     w3, 'b'
        mov     w2, 12
        mov     w1, 'a' 
        add     x0, sp, x               // address of first record
        bl      load_record             // load values

        mov     w5, 'f'                 // data to load
        mov     w4, 78
        mov     w3, 'e'
        mov     w2, 56
        mov     w1, 'd' 
        add     x0, sp, y               // address of second record
        bl      load_record             // load values

        ldr     x0, [sp, x]             // 1st 8 bytes of x
        ldr     w1, [sp, x+8]           // last 4 bytes of x
        bl      display_record          // display x

        ldr     x0, [sp, y]             // 1st 8 bytes of y
        ldr     w1, [sp, y+8]           // last 4 bytes of y
        bl      display_record          // display y

        mov     w0, wzr                 // return 0;
        ldp     fp, lr, [sp], FRAME     // undo stack frame
        ret
