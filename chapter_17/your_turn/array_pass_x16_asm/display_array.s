// Display ints in an array.
// Calling sequence
//    x0 <- address of array
//    w1 <- number of array elements
        .arch armv8-a
// Stack frame
        .equ    save1920, 16
        .equ    save21, 32
        .equ    FRAME, 48
// Code
        .section  .rodata
        .align  3
msg1:
        .string "my_array["
msg2:
        .string "] = "
        .text
        .align  2
        .global display_array
        .type   display_array, %function
display_array:
        stp     fp, lr, [sp, -FRAME]!     // Create stack frame
        mov     fp, sp                    // Set our frame pointer
        stp     x19, x20,  [sp, save1920] // Save regs
        str     x21, [sp, save21]

        mov     x19, x0                   // Array address
        mov     w20, w1                   // Array size
        mov     w21, wzr                  // Array index
loop:
        adr     x0, msg1                  // Start line
        bl      write_str
        mov     w0, w21                   // Index
        bl      put_int
        adr     x0, msg2                  // More text on line
        bl      write_str
        ldr     w0, [x19, w21, uxtw 2]    // Current element
        bl      put_int
        mov     w0, '\n'                  // Finish line
        bl      write_char
        add     w21, w21, 1               // Increment index
        cmp     w21, w20                  // At end?
        b.lt    loop                      // No, continue

        mov     w0, wzr                   // Return 0
        ldp     x19, x20,  [sp, save1920] // Restore regs
        ldr     x21, [sp, save21]
        ldp     fp, lr, [sp], FRAME       // Delete stack frame
        ret
