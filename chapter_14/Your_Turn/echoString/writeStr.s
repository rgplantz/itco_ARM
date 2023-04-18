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
        .equ    frame, 32 
// The code
        .text
        .align  2
        .global writeStr
        .type   writeStr, %function
writeStr:
        stp     fp, lr, [sp, -frame]! // our stack frame
        stp     x19, x20, [sp, save1920]  // preserve regs
        mov     x19, x0               // address of string
        mov     w20, wzr              // count = 0
whileLoop:
        ldrb    w0, [x19]             // get a char
        cmp     w0, NUL               // end of string?
        b.eq     allDone              // yes, all done

        mov     w2, 1                 // no, write 1 byte
        mov     x1, x19               // address of current char
        mov     w0, STDOUT            // write to screen
        bl      write

        add     x19, x19, 1           // increment pointer var
        add     w20, w20, 1           // count++
        b       whileLoop             // back to top
allDone:
        mov     w0, w20               // return count;
        ldp     x19, x20, [sp, save1920]  // restore regs
        ldp     fp, lr, [sp], frame   // undo stack frame
        ret                           // back to caller
