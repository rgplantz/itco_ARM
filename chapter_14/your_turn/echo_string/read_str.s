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
// Stack frame
        .equ    save1920, 16
        .equ    save21, 32
        .equ    FRAME, 48 
// The code
        .text
        .align  2
        .global read_str
        .type   read_str, %function
read_str:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        stp     x19, x20, [sp, save1920]  // Save regs
        str     x21, [sp, save21]
        mov     x19, x0               // Address of string
        mov     w20, wzr              // count = 0
        mov     w21, w1               // Max chars

read_loop:
        mov     w2, 1                 // Read 1 byte
        mov     x1, x19               // Place to store current char
        mov     w0, STDIN             // Read from keyboard
        bl      read

        ldrb    w0, [x19]             // Get just read char
        cmp     w0, LF                // return key?
        b.eq    end_input             // Yes, end of input
        cmp     w20, w21              // No, is caller's array full?
        b.ge    read_loop             // Yes, read but don't keep
        add     x19, x19, 1           // no, next byte
        add     w20, w20, 1           // count++
        b       read_loop             // Back to reading
end_input:
        mov     w0, NUL               // String terminator
        strb    wzr, [x19]            // Replace LF
        mov     w0, w20               // Return count
        ldr     w21, [sp, save21]     // Restore regs
        ldp     x19, x20, [sp, save1920]
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret
