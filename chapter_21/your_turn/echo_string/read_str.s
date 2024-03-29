// Reads a line (through the '\n') from standard input. Does not
// stores '\n' and any characters beyond maximum. Appends NUL at
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
        .equ    READ, 0x3f
// Stack frame
        .equ    save1920, 16
        .equ    save21, 32
        .equ    frame, 48 
// The code
        .text
        .align  2
        .global read_str
        .type   read_str, %function
read_str:
        stp     fp, lr, [sp, -frame]! // our stack frame
        stp     x19, x20, [sp, save1920]  // preserve regs
        str     x21, [sp, save21]
        mov     x19, x0               // address of string
        mov     w20, wzr              // count = 0
        mov     w21, w1               // max chars

read_loop:
        mov     w2, 1                 // read 1 byte
        mov     x1, x19               // place to store current char
        mov     w0, STDIN             // read from keyboard
        mov     x8, READ
        svc     0                     // tell OS to do it

        ldrb    w0, [x19]             // get just read char
        cmp     w0, LF                // return key?
        b.eq    end_input             // yes, end of input
        cmp     w20, w21              // no, is caller's array full?
        b.ge    read_loop             // yes, read but don't keep
        add     x19, x19, 1           // no, next byte
        add     w20, w20, 1           // count++
        b       read_loop             // back to reading
end_input:
        mov     w0, NUL               // string terminator
        strb    wzr, [x19]            // replace LF
        mov     w0, w20               // return count;
        ldr     w21, [sp, save21]     // restore regs
        ldp     x19, x20, [sp, save1920]
        ldp     fp, lr, [sp], frame   // undo stack frame
        ret                           // back to caller
