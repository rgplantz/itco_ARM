// Sum the integers between two entered by user.
        .arch armv8-a
// Stack frame
        .equ    x, 16
        .equ    y, 20
        .equ    FRAME, 32
// Constant data
        .section  .rodata
        .align  3
prompt:
        .string "Enter an integer: "
in_format:
        .string "%i"
out_format:
        .string "The sum is %i\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        sub     sp, sp, FRAME   // Allocate our stack frame
        stp     fp, lr, [sp]    // Create stack frame
        mov     fp, sp          // Set our frame pointer

        adr     x0, prompt      // Ask for integer 
        bl      printf
        add     x1, sp, x       // Place for first int
        adr     x0, in_format   // scanf format string
        bl      scanf           // Get the int

        adr     x0, prompt      // Ask for integer 
        bl      printf
        add     x1, sp, y       // Place for second int
        adr     x0, in_format   // scanf format string
        bl      scanf           // Get the int

        ldr     w0, [sp, x]
        ldr     w1, [sp, y]
        bl      add_ints        // Add them
        mov     w1, w0
        adr     x0, out_format
        bl      printf

        mov     w0, wzr         // Return 0
        ldp     fp, lr, [sp]    // Restore fp and lr
        add     sp, sp, FRAME   // Delete stack frame
        ret                     // Back to caller
