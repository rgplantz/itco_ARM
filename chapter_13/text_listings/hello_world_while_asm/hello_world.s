// Writes Hello, World! one character at a time
        .arch armv8-a
// Useful names
        .equ    NUL, 0
        .equ    STDOUT, 1
// Stack frame
        .equ    FRAME,16
// Constant data
        .section  .rodata
message:
        .string "Hello, World!\n"
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        adr     x19, message          // address of message
loop:
        ldrb    w0, [x19]             // load character
        cmp     w0, NUL               // end of string?
        b.eq    done                  // yes
        mov     w2, 1                 // no, one char
        mov     x1, x19               // address of char
        mov     x0, STDOUT            // write on screen
        bl      write
        add     x19, x19, 1           // increment pointer
        b       loop                  // and continue
done:
        mov     w0, wzr               // return value
        ldp     fp, lr, [sp], FRAME   // undo our stack frame
        ret
