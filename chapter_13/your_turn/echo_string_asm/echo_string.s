// Echo characters entered on keyboard.
        .arch armv8-a
// Useful names
        .equ    MAX, 10
        .equ    NUL, 0
        .equ    LF, 10          // '\n' in Linux
        .equ    STDIN, 0
        .equ    STDOUT, 1
// Stack frame
        .equ    the_string, 16
        .equ    save19, 32
        .equ    FRAME, 48 
// Constant data
        .section  .rodata
prompt:
        .string "Enter up to 10 characters: "
response:
        .string "You entered: "
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        str     x19, [sp, save19]     // Save for caller
        adr     x19, prompt           // Address of prompt message
prompt_loop:
        ldrb    w0, [x19]             // Load character
        cmp     w0, LF                // End of string?
        b.eq    read_input            // Yes
        mov     w2, 1                 // No, one char
        mov     x1, x19               // Address of char
        mov     x0, STDOUT            // Write on screen
        bl      write
        add     x19, x19, 1           // Increment pointer
        b       prompt_loop           //   and continue
read_input:
        add     x19, sp, the_string   // Address of string storage
read_loop:
        mov     w2, 1                 // One char
        mov     x1, x19               // Place to store it
        mov     x0, STDIN             // Read from keyboard
        bl      read
        ldrb    w0, [x19]             // Load character
        cmp     w0, NUL               // End of string?
        b.eq    done                  // Yes
        ldrb    w0, [x19]             // Load most recent character
        add     x19, x19, 1           // Increment pointer
        cmp     w0, LF                // End of input?
        b.ne    read_loop             // No, continue reading

        strb    [x19], NUL            // Yes, terminate the string
        add     x19, sp, the_string   // Get beginning of string storage
response_loop:
        ldrb    w0, [x19]             // Load character
        cmp     w0, NUL               // End of string?
        b.eq    done                  // Yes
        mov     w2, 1                 // No, one char
        mov     x1, x19               // Address of char
        mov     x0, STDOUT            // Write on screen
        bl      write
        add     x19, x19, 1           // Increment pointer
        b       response_loop         //   and continue
done:
        mov     w0, wzr               // Return 0
        ldr     x19, [sp, save19]     // Restore reg
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret
