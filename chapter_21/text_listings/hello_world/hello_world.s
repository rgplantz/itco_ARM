// Write Hello, World! using a system call.
        .arch armv8-a
// Useful names
        .equ    NUL, 0
        .equ    STDOUT, 1
        .equ    WRITE, 0x40
        .equ    EXIT, 0x5d
// Stack frame
        .equ    save19, 16
        .equ    FRAME, 32
// Constant data
        .section  .rodata
message:
        .string "Hello, World!\n"
// Code
        .text
        .align  2
        .global my_hello
        .type   my_hello, %function
my_hello:
        adr     x1, message       // Address of message
loop:
        ldrb    w3, [x1]          // Load character
        cmp     w3, NUL           // End of string?
        b.eq    done              // Yes
        mov     x2, 1             // No, one char
        mov     x0, STDOUT        // Write on screen
        mov     x8, WRITE
        svc     0                 // Tell OS to do it
        add     x1, x1, 1         // Increment pointer
        b       loop              //   and continue
done:
        mov     w0, wzr           // Return value
        mov     x8, EXIT          // Terminate this process
        svc     0
