// Reads a line (through the '\n') from standard input. Does not
// store '\n' and any characters beyond maximum. Appends NUL at
// end of stored characters. Allow maximum + 1 for character storage.
// Calling sequence:
//        x0 <- address of place to store string
//        w1 <- maximum characters to store
// returns number of characters read

        .arch   armv8-a
// Useful constants
        .equ    STDIN, 0
        .equ    NUL, 0
        .equ    LF, 10          // '\n' in Linux
// Stack frame
        .equ    save1920, 16
        .equ    save21, 32
        .equ    frame, 48 
// The code
        .text
        .align  2
        .global readStr
        .type   readStr, %function
readStr:
        stp     fp, lr, [sp, -frame]! // our stack frame
        stp     x19, x20, [sp, save1920]  // preserve regs
        str     x21, [sp, save21]
        mov     x19, x0               // address of string
        mov     w20, wzr              // count = 0
        mov     w21, w1               // max chars

readLoop:
        mov     w2, 1                 // read 1 byte
        mov     x1, x19               // place to store current char
        mov     w0, STDIN             // read from keyboard
        bl      read

        ldrb    w0, [x19]             // get just read char
        cmp     w0, LF                // return key?
        b.eq    endOfInput            // yes, end of input
        cmp     w20, w21              // no, is caller's array full?
        b.ge    readLoop              // yes, read but don't keep
        add     x19, x19, 1           // no, next byte
        add     w20, w20, 1           // count++
        b       readLoop              // back to reading
endOfInput:
        mov     w0, NUL               // string terminator
        strb    w0, [x19]             // replace LF
        mov     w0, w20               // return count;
        ldp     x19, x20, [sp, save1920]  // restore regs
        ldr     w21, [sp, save21]
        ldp     fp, lr, [sp], frame   // undo stack frame
        ret                           // back to caller
