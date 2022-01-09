// switch.s
// Three-way selection
        .arch armv8-a
// Useful constants
        .equ    NTIMES,10                 // number of loops
// Stack frame
        .equ    frameSize,32
// Code
        .text
        .section        .rodata
        .align  3
message1:
        .string "i = 1"
        .align  3
message2:
        .string "i = 2"
        .align  3
message3:
        .string "i = 3"
        .align  3
messageDflt:
        .string "i > 3"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frameSize]! // create our stack frame
        mov     fp, sp                    // set our frame pointer
        str     w19, [sp, 28]             // save for i local var.
        mov     w19, 0                    // i = 0;
forLoop:
        mov     w0, NTIMES                // total number of times
        cmp     w19, w0                   // is i at end?
        b.hs    allDone                   // yes
        bl      random                    // no, get random number
        mov     w1, MIDDLE                // half way
        cmp     w1, w0                    // above or below middle?
        bgt     tails                     // above -> tails
        adrp    x0, headsMsg              // below -> heads message
        add     x0, x0, :lo12:headsMsg    // message offset in page
        bl      puts                      // print message
        b       continue                  // skip else part
tails:
        adrp    x0, tailsMsg              // tails message page address
        add     x0, x0, :lo12:tailsMsg    // message offset in page
        bl      puts                      // print message
continue:
        add     w19, w19, 1               // i++;
        b       forLoop                   // and continue loop
allDone:
        mov     w0, 0                     // return 0
        ldr     w19, [sp, 28]             // restore regs.
        ldp     fp, lr, [sp], frameSize   // restore fp, lr, sp
        ret                               // back to caller

        .data
        .align  3
jumpTable:
        .xword  case1
        .xword  case2
        .xword  case3
        .xword  default
