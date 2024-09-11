// Add constant to automatic, static, global variables.
        .arch armv8-a
// Useful names
        .equ    INIT_X, 78
        .equ    INIT_Y, 90
        .equ    ADDITION, 1000
// Stack frame
        .equ    x, 28
        .equ    FRAME, 32
// Code
        .data
        .align  2
        .type   y, %object
        .size   y, 4
y:
        .word   INIT_Y
        .align  2
        .type   count, %object
        .size   count, 4
count:
        .word   0
        .section  .rodata
msg:
        .string "In add_const:%7i %8i %8i, call number %i\n"
        .text
        .align  2
        .global add_const
        .type   add_const, %function
add_const:
        stp     fp, lr, [sp, -FRAME]!   // Create stack frame
        mov     fp, sp                  // Set frame pointer

        mov     w0, INIT_X
        add     w0, w0, ADDITION        // Add constant
        str     w0, [sp, x]             // x += ADDITION
        adr     x0, y
        ldr     w1, [x0]                // Load our y
        add     w1, w1, ADDITION        // Add constant
        str     w1, [x0]                // y += ADDITION    
        adrp    x0, :got:z              // z page number
        ldr     x0, [x0, :got_lo12:z]   // z address
        ldr     w1, [x0]                // load z
        add     w1, w1, ADDITION        // add constant
        str     w1, [x0]                // z += ADDITION;

        adr     x0, count
        ldr     w4, [x0]                // Load our count
        add     w4, w4, 1               // Increment
        str     w4, [x0]    
        adrp    x0, :got:z              // z page number
        ldr     x0, [x0, :got_lo12:z]   // z address
        ldr     w3, [x0]                // load z
        adr     x0, y
        ldr     w2, [x0]                // Load our y
        ldr     w1, [sp, x]             // load our x
        adr     x0, msg                 // message
        bl      printf

        mov     w0, wzr                `// Return 0
        ldp     fp, lr, [sp], FRAME     // Delete stack frame
        ret
