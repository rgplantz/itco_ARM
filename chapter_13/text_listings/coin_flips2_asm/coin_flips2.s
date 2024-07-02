// Flip a coin, showing heads or tails.
        .arch armv8-a
// Useful names
        .equ    N_TIMES, 10           // Number of flips
        .equ    RAND_MID, 1073741823  // RAND_MAX/2
// Stack frame
        .equ    save19, 28
        .equ    FRAME, 32
// Constant data
        .section  .rodata
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
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        str     w19, [sp, save19]     // Save for i local var
        mov     w19, wzr              // i = 0
loop:
        mov     w0, N_TIMES           // Total number of times
        cmp     w19, w0               // Is i at end?
        b.hs    done                  // Yes
        bl      random                // No, get random number
        mov     w1, RAND_MID          // Halfway
        cmp     w1, w0                // Above or below middle?
        b.hi    tails                 // Above -> tails
        adr     x0, heads_msg         // Below -> heads message
        bl      puts                  // Print message
        b       continue              // Skip else part
tails:
        adr     x0, tails_msg         // Tails message page address
        bl      puts                  // Print message
continue:
        add     w19, w19, 1           // increment i
        b       loop                  //   and continue loop
done:
        mov     w0, wzr               // Return 0
        ldr     w19, [sp, save19]     // Restore reg
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret                           // Back to caller
