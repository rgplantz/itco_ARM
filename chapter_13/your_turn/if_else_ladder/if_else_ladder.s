// Select one of three or default.
        .arch armv8-a
// Useful names
        .equ    NTIMES, 10            // number of loops
// Stack frame
        .equ    save19, 16
        .equ    FRAME, 32
// Constant data
        .section        .rodata
one_msg:
        .string "i = 1"
two_msg:
        .string "i = 2"
three_msg:
        .string "i = 3"
over_msg:
        .string "i > 3"
// Program code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        str     x19, [sp, save19]     // Save reg
        mov     w19, 1                // i = 1
loop:
        cmp     x19, NTIMES           // Is i at end?
        b.hi    all_done              // Yes, leave loop
        cmp     w19, 1                // One?
        b.ne    two                   // No
        adr     x0, one_msg           // Yes, tell user
        bl      puts
        b       continue
two:
        cmp     w19, 2                // Two?
        b.ne    three                 // No
        adr     x0, two_msg           // Yes
        bl      puts
        b       continue
three:
        cmp     w19, 3                // Three?
        b.ne    over                  // No
        adr     x0, three_msg         // Yes
        bl      puts
        b       continue
over:
        adr     x0, over_msg
        bl      puts
continue:
        add     w19, w19, 1           // i++
        b       loop                  // And continue loop
all_done:
        mov     w0, wzr               // Return 0
        ldr     x21, [sp, save19]     // Restore reg
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret
