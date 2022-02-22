// readLn.s
// Reads a line (through the '\n') from standard input. Has
// a size limit. Extra characters and '\n' are ignored. Stores
// NUL-terminated C string.
// Calling sequence:
//        x0 <- address of place to store string
//        w1 <- string size limit
//        bl    readLn
// returns number of characters written

        .arch   armv8-a
// Useful constants
        .equ    STDIN,0
        .equ    NUL,0
        .equ    LF,10       // '\n' in Linux
// Stack frame
        .equ    save19, 16
        .equ    save20, 24
        .equ    save21, 32
        .equ    frameSize, 48 
// The code
        .text
        .align  2
        .global readLn
        .type   readLn, %function
readLn:
        stp     fp, lr, [sp, -frameSize]!  // our stack frame
        str     x19, [sp, save19]   // preserve regs
        str     x20, [sp, save20]
        str     x21, [sp, save21]
        mov     x19, x0             // address of string
        mov     w20, wzr            // count = 0
        mov     w21, w1             // length limit
        sub     w21, w21, 1         // room for NUL

readLoop:
        mov     w2, 1               // read 1 byte
        mov     x1, x19             // place to store current char
        mov     w0, STDIN           // read from keyboard
        bl      read
        ldrb    w0, [x19]           // get just read char
        cmp     w0, LF              // return key?
        beq     endOfString         // yes, mark end of string
        cmp     w20, w21            // is caller's array full?
        bge     readLoop            // yes, read but don't keep
        add     x19, x19, 1         // no, next byte
        add     w20, w20, 1         // count++
        b       readLoop            // back to reading
endOfString:
        mov     w0, NUL             // string terminator
        strb    w0, [x19]
        mov     w0, w20             // return count;
        ldr     x19, [sp, save19]   // restore regs
        ldr     w20, [sp, save20]
        ldr     w21, [sp, save21]
        ldp     fp, lr, [sp], frameSize // undo stack frame
        ret                         // back to caller
