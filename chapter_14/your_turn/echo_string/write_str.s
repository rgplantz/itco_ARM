// Writes a C-style text string to the standard output (screen).
// Calling sequence:
//       x0 <- address of string to be written
// returns number of characters written

        .arch   armv8-a
// Useful constants
        .equ    STDOUT, 1
        .equ    NUL, 0
// Stack frame
        .equ    save1920, 16
        .equ    FRAME, 32 
// The code
        .text
        .align  2
        .global write_str
        .type   write_str, %function
write_str:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        stp     x19, x20, [sp, save1920]  // Save regs
        mov     x19, x0               // Address of string
        mov     w20, wzr              // count = 0
while:
        ldrb    w0, [x19]             // Get a char
        cmp     w0, NUL               // End of string?
        b.eq     done                 // Yes, all done

        mov     w2, 1                 // No, write 1 byte
        mov     x1, x19               // Address of current char
        mov     w0, STDOUT            // Write to screen
        bl      write

        add     x19, x19, 1           // Increment pointer var
        add     w20, w20, 1           // count++
        b       while                 // Back to top
done:
        mov     w0, w20               // Return count
        ldp     x19, x20, [sp, save1920]  // Restore regs
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret
