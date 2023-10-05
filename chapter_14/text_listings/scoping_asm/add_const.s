// Adds constant to automatic, static, global variables.
        .arch armv8-a
// Useful names
        .equ    INITX, 78
        .equ    INITY, 90
        .equ    ADDITION, 1000
// Stack frame
        .equ    x, 28
        .equ    FRAME,32
// Code
        .data
        .align  2
        .type   y, %object
        .size   y, 4
y:
        .word   INITY
        .section  .rodata
msg:
        .string "In add_const:%8i %8i %8i\n"
        .text
        .align  2
        .global add_const
        .type   add_const, %function
add_const:
        stp     fp, lr, [sp, -FRAME]!   // create our stack frame
        mov     fp, sp                  // set our frame pointer

        mov     w0, INITX
        add     w0, w0, ADDITION        // add constant
        str     w0, [sp, x]             // x += ADDITION;
        adr     x0, y
        ldr     w1, [x0]                // load our y
        add     w1, w1, ADDITION        // add constant
        str     w1, [x0]                // y += ADDITION;    
        adrp    x0, :got:z              // z page number
        ldr     x0, [x0, :got_lo12:z]   // z address
        ldr     w1, [x0]                // load z
        add     w1, w1, ADDITION        // add constant
        str     w1, [x0]                // z += ADDITION;

        adrp    x0, :got:z              // z page number
        ldr     x0, [x0, :got_lo12:z]   // z address
        ldr     w3, [x0]                // load z
        adr     x0, y
        ldr     w2, [x0]                // load our y
        ldr     w1, [sp, x]             // load our x
        adr     x0, msg                 // message
        bl      printf

        mov     w0, wzr                 // return 0
        ldp     fp, lr, [sp], FRAME     // restore fp, lr, sp
        ret                             // back to caller
