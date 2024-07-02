// Write Hello, World! one character at a time.
        .arch armv8-a
// Useful names
        .equ    NUL, 0
        .equ    STDOUT, 1
// Stack frame
        .equ    FRAME, 16
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
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        adr     x19, message          // Address of message
loop:
        ldrb    w0, [x19]             // Load character
        cmp     w0, NUL               // End of string?
        b.eq    done                  // Yes
        mov     w2, 1                 // No, one char
        mov     x1, x19               // Address of char
        mov     x0, STDOUT            // Write on screen
        bl      write
        add     x19, x19, 1           // Increment pointer
        b       loop                  //   and continue
done:
        mov     w0, wzr               // Return 0
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret
