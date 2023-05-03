// Writes a char to the standard output (screen).
// Calling sequence:
//       w0 <- char to be written
// returns 0

        .arch   armv8-a
// Useful constants
        .equ    STDOUT, 1
// Stack frame
        .equ    theChar, 16
        .equ    frame, 32 
// The code
        .text
        .align  2
        .global writeChar
        .type   writeChar, %function
writeChar:
        stp     fp, lr, [sp, -frame]! // our stack frame
        strb    w0, [sp, theChar]     // store input char

        mov     w2, 1                 // write 1 byte
        add     x1, sp, theChar       // address of char
        mov     w0, STDOUT            // write to screen
        bl      write

        mov     w0, wzr               // return 0
        ldp     fp, lr, [sp], frame   // undo stack frame
        ret                           // back to caller
