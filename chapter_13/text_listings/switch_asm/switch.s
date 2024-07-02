// Select one of three or default.
        .arch armv8-a
// Useful names
        .equ    N_TIMES, 10           // Number of loops
        .equ    DEFAULT, 4            // Default case
// Stack frame
        .equ    save1920, 16
        .equ    FRAME, 32
// Constant data
        .section  .rodata
one_msg:
        .string "i = 1"
two_msg:
        .string "i = 2"
three_msg:
        .string "i = 3"
over_msg:
        .string "i > 3"
// Branch table
        .align  3
br_table:
        .quad   one                   // Addresses where messages
        .quad   two                   //   are printed
        .quad   three
        .quad   default
// Program code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]! // Create stack frame
        mov     fp, sp                // Set our frame pointer
        stp     x19, x20, [sp, save1920]  // Save for caller
        mov     x19, 1                // i = 1
        mov     x20, DEFAULT          // Default case
loop:
        cmp     x19, N_TIMES          // Is i at end?
        b.hi    done                  // Yes, leave loop
        adr     x0, br_table          // Address of branch table
        cmp     x19, x20              // Default case?
        csel    x1, x19, x20, lo      // Low, use i
        sub     x1, x1, 1             // Relative to first table entry
        add     x0, x0, x1, lsl 3     // Add address offset in table
        ldr     x0, [x0]              // Load address from table
        br      x0                    //   and branch there
one:
        adr     x0, one_msg           // = 1
        bl      puts                  // Write to screen
        b       continue
two:
        adr     x0, two_msg           // = 2
        bl      puts                  // Write to screen
        b       continue
three:
        adr     x0, three_msg         // = 3
        bl      puts                  // Write to screen
        b       continue
default:
        adr     x0, over_msg          // > 3
        bl      puts                  // Write to screen
continue:
        add     x19, x19, 1           // increment i
        b       loop                  //   and continue loop
done:
        mov     w0, wzr               // Return 0
        ldp     x19, x20, [sp, save1920]  // Restore reg
        ldp     fp, lr, [sp], FRAME   // Delete stack frame
        ret                           // Back to caller
