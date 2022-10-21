// coinFlips2.s
// Flips a coin, heads or tails.
        .arch armv8-a
// Useful constants
        .equ    NTIMES,10                 // number of flips
        .equ    MIDDLE,1073741823         // RAND_MAX/2
// Stack frame
        .equ    frame,32
// Code
        .text
        .section        .rodata
        .align  3
headsMsg:
        .string "heads"
        .align  3
tailsMsg:
        .string "tails"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        str     w19, [sp, 28]         // save for i local var.
        mov     w19, 0                // i = 0;
forLoop:
        mov     w0, NTIMES            // total number of times
        cmp     w19, w0               // is i at end?
        b.hs    allDone               // yes
        bl      random                // no, get random number
        mov     w1, MIDDLE            // half way
        cmp     w1, w0                // above or below middle?
        b.hi    tails                 // above -> tails
        adr     x0, headsMsg          // below -> heads message
        bl      puts                  // print message
        b       continue              // skip else part
tails:
        adr     x0, tailsMsg          // tails message page address
        bl      puts                  // print message
continue:
        add     w19, w19, 1           // i++;
        b       forLoop               // and continue loop
allDone:
        mov     w0, wzr               // return 0
        ldr     w19, [sp, 28]         // restore regs.
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
