// Writes a char to the standard output (screen).
// Calling sequence:
//       w0 <- char to be written
// returns 0

        .arch   armv8-a
// Useful constants
        .equ    STDOUT, 1
// Stack frame
        .equ    a_char, 16
        .equ    frame, 32 
// The code
        .text
        .align  2
        .global write_char
        .type   write_char, %function
write_char:
        stp     fp, lr, [sp, -frame]! // our stack frame
        strb    w0, [sp, a_char]      // store input char

        mov     w2, 1                 // write 1 byte
        add     x1, sp, a_char        // address of char
        mov     w0, STDOUT            // write to screen
        bl      write

        mov     w0, wzr               // return 0
        ldp     fp, lr, [sp], frame   // undo stack frame
        ret                           // back to caller
