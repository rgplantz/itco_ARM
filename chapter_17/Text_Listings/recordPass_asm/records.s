// Allocates two records, assigns a value to each field
// in each record, and displays the contents.
        .arch armv8-a
// Stack frame
        .equ    xRecord, 16
        .equ    yRecord, 36
        .equ    temp, 56
        .equ    frame, 80
// Record field definitions
        .include "aRecord.s"
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frame]!   // create our stack frame
        mov     fp, sp                  // Set frame pointer

        mov     w5, 'c'                 // data to load
        mov     w4, 34
        mov     w3, 'b'
        mov     w2, 12
        mov     w1, 'a' 
        add     x0, sp, xRecord         // address of first record
        bl      loadRecord              // load values

        mov     w5, 'f'                 // data to load
        mov     w4, 78
        mov     w3, 'e'
        mov     w2, 56
        mov     w1, 'd' 
        add     x0, sp, yRecord         // address of second record
        bl      loadRecord              // load values

        ldr     x0, [sp, xRecord]       // make copy of x
        str     x0, [sp, temp]
        ldr     w0, [sp, xRecord+4]     // 20 bytes
        str     w0, [sp, temp+4]        // 20 bytes
        add     x0, sp, temp            // address of copy
        bl      displayRecord           // display copy

        ldr     x0, [sp, yRecord]       // make copy of y
        str     x0, [sp, temp]
        ldr     w0, [sp, yRecord+4]     // 20 bytes
        str     w0, [sp, temp+4]        // 20 bytes
        add     x0, sp, temp            // address of copy
        bl      displayRecord           // display copy

        mov     w0, wzr                 // return 0;
        ldp     fp, lr, [sp], frame     // undo stack frame
        ret
