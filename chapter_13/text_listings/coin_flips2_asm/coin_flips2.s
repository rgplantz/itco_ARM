// Flips a coin, heads or tails.
        .arch armv8-a
// Useful names
        .equ    N_TIMES,              // number of flips
        .equ    RAND_MID,1073741823   // RAND_MAX/2
// Stack frame
        .equ    SAVE19, 24
        .equ    FRAME,32
// Constant data
        .section        .rodata
heads_msg:
        .string "heads"
tails_msg:
        .string "tails"
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        str     x19, [sp, SAVE19]     // save for i local var.
        mov     w19, wzr              // i = 0;
for_loop:
        mov     w0, N_TIMES           // total number of times
        cmp     w19, w0               // is i at end?
        b.hs    done                  // yes
        bl      random                // no, get random number
        mov     w1, RAND_MID          // half way
        cmp     w1, w0                // above or below middle?
        b.hi    tails                 // above -> tails
        adr     x0, heads_msg         // below -> heads message
        bl      puts                  // print message
        b       continue              // skip else part
tails:
        adr     x0, tails_msg         // tails message page address
        bl      puts                  // print message
continue:
        add     w19, w19, 1           // i++;
        b       for_foop              // and continue loop
done:
        mov     w0, wzr               // return 0
        ldr     x19, [sp, SAVE19]     // restore reg.
        ldp     fp, lr, [sp], FRAME   // restore fp, lr, sp
        ret                           // back to caller
