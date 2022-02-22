// writeStr.s
// Writes a C-style text string to the standard output (screen).
// Calling sequence:
//       x0 <- address of string to be written
//       bl    writestr
// returns number of characters written

        .arch   armv8-a
// Useful constants
        .equ    STDOUT,1
        .equ    NUL,0
// Stack frame
        .equ    save19, 16
        .equ    save20, 28
        .equ    frameSize, 32 
// The code
        .text
        .align  2
        .global writeStr
        .type   writeStr, %function
writeStr:
        stp     fp, lr, [sp, -frameSize]! // our stack frame
        str     x19, [sp, save19]   // preserve regs
        str     x20, [sp, save20]
        mov     x19, x0             // address of string
        mov     w20, wzr            // count = 0
whileLoop:
        ldrb    w0, [x19]           // get a char
        cmp     w0, NUL             // end of string?
        beq     allDone             // yes, all done

        mov     w2, 1               // write 1 byte
        mov     x1, x19             // address of current char
        mov     w0, STDOUT          // no, write to screen
        bl      write

        add     x19, x19, 1         // increment pointer var
        add     w20, w20, 1         // count++
        b       whileLoop           // back to top
allDone:
        mov     w0, w20             // return count;
        ldr     x19, [sp, save19]   // restore regs
        ldr     w20, [sp, save20]
        ldp     fp, lr, [sp], frameSize // undo stack frame
        ret                         // back to caller
