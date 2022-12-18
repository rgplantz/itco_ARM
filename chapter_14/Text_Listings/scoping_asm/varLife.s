// addTwo.s
// Adds two integers and outputs sum.
        .arch armv8-a
// Useful names
        .equ    INITX, 12
        .equ    INITY, 34
        .equ    INITZ, 57
// Stack frame
        .equ    x, 24
        .equ    y, 28
        .equ    frame, 32
// Code
        .global z
        .data
        .align  2
        .type   z, %object
        .size   z, 4
z:
        .word   56
        .align  2
        .type   main_y, %object
        .size   main_y, 4
main_y:
        .word   90
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
        stp     fp, lr, [sp, -frame]!   // create our stack frame
        mov     fp, sp                  // set our frame pointer

        mov     w0, INITX
        str     w0, [sp, x]             // x = INITX;
        mov     w0, INITY
        str     w0, [sp, x]             // y = INITY;
        adr     x0, heading0            // print 2-line header
        bl      puts
        adr     x0, heading1
        bl      puts

        adr     x0, z 
        ldr     w3, [x0]                // local global z
        ldr     w2, [sp, y]             // local y
        ldr     w1, [sp, x]             // and local x
        adr     x0, msg                 // show values
        bl      printf

        bl      addConst                // add constants
        bl      addConst                //     twice

        adr     x0, z                   // repeat display
        ldr     w3, [x0]
        ldr     w2, [sp, y]
        ldr     w1, [sp, x]
        adr     x0, msg
        bl      printf

        mov     w0, wzr                 // return 0
        ldp     fp, lr, [sp], frame     // restore fp, lr, sp
        ret                             // back to caller
