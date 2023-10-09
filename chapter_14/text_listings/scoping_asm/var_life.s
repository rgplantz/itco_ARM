// Compares scope and lifetime of automatic, static,
// and global variables.
        .arch armv8-a
// Useful names
        .equ    INIT_X, 12
        .equ    INIT_Y, 34
        .equ    INIT_Z, 56
// Stack frame
        .equ    x, 24
        .equ    y, 28
        .equ    FRAME, 32
// Code
        .global z
        .data
        .align  2
        .type   z, %object
        .size   z, 4
z:
        .word   INIT_Z
        .section        .rodata
heading0:
        .string "           automatic   static   global"
heading1:
        .string "                   x        y        z"
msg:
        .string "In main:%12i %8i %8i\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]!   // create our stack frame
        mov     fp, sp                  // set our frame pointer

        mov     w0, INIT_X
        str     w0, [sp, x]             // x = INIT_X;
        mov     w0, INIT_Y
        str     w0, [sp, y]             // y = INIT_Y;
        adr     x0, heading0            // print 2-line header
        bl      puts
        adr     x0, heading1
        bl      puts

        adr     x0, z 
        ldr     w3, [x0]                // global z
        ldr     w2, [sp, y]             // local y
        ldr     w1, [sp, x]             // and local x
        adr     x0, msg                 // show values
        bl      printf

        bl      add_const               // add constants
        bl      add_const               //     twice

        adr     x0, z                   // repeat display
        ldr     w3, [x0]
        ldr     w2, [sp, y]
        ldr     w1, [sp, x]
        adr     x0, msg
        bl      printf

        mov     w0, wzr                 // return 0
        ldp     fp, lr, [sp], FRAME     // restore fp, lr, sp
        ret                             // back to caller
