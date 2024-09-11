// Writes a char to the standard output (screen).
// Calling sequence:
//       w0 <- char to be written
// returns 0

        .arch   armv8-a
// Useful constants
        .equ    STDOUT, 1
// Stack frame
        .equ    a_char, 16
        .equ    FRAME, 32 
// The code
        .text
        .align  2
        .global write_char
        .type   write_char, %function
write_char:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        strb    w0, [sp, a_char]      // Store input char

        mov     w2, 1                 // Write 1 byte
        add     x1, sp, a_char        // Address of char
        mov     w0, STDOUT            // Write to screen
        bl      write

        mov     w0, wzr               // Return 0
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret
