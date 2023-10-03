// Three-way selection
        .arch armv8-a
// Useful names
        .equ    N_TIMES, 10           // number of loops
        .equ    DEFAULT, 4            // default case
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
        .quad   one                   // addresses where messages
        .quad   two                   // are printed
        .quad   three
        .quad   default
// Program code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -FRAME]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        stp     x19, x20, [sp, save1920]  // save for caller
        mov     x19, 1                // i = 1
        mov     x20, DEFAULT          // default case
loop:
        cmp     x19, N_TIMES          // is i at end?
        b.hi    done                  // yes, leave loop
        adr     x0, br_table          // address of branch table
        cmp     x19, x20              // default case?
        csel    x1, x19, x20, lo      // low, use i
        sub     x1, x1, 1             // relative to first table entry
        add     x0, x0, x1, lsl 3     // add address offset in table
        ldr     x0, [x0]              // load address from table
        br      x0                    //     and branch there
one:
        adr     x0, one_msg           // = 1
        bl      puts                  // write on screen
        b       continue
two:
        adr     x0, two_msg           // = 2
        bl      puts                  // write on screen
        b       continue
three:
        adr     x0, three_msg         // = 3
        bl      puts                  // write on screen
        b       continue
default:
        adr     x0, over_msg// > 3
        bl      puts                  // write on screen
continue:
        add     x19, x19, 1           // i++;
        b       loop                  // and continue loop
done:
        mov     w0, wzr               // return 0
        ldp     x19, x20, [sp, save1920]  // restore reg.
        ldp     fp, lr, [sp], FRAME   // restore fp, lr, sp
        ret                           // back to caller
