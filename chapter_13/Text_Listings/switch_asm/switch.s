// switch.s
// Three-way selection
        .arch armv8-a
// Useful names
        .equ    NTIMES, 10            // number of loops
        .equ    DEFAULT, 4            // default case
// Stack frame
        .equ    saveReg, 16
        .equ    frame, 32
// Constant data
        .section        .rodata
oneMsg:
        .string "i = 1"
twoMsg:
        .string "i = 2"
threeMsg:
        .string "i = 3"
overMsg:
        .string "i > 3"
// Branch table
        .align  3
brTable:
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
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        stp     x19, x20, [sp, saveReg] // save for caller
        mov     x19, 1                // i = 1
        mov     x20, DEFAULT          // default case
forLoop:
        cmp     x19, NTIMES           // is i at end?
        b.hi    allDone               // yes
        cmp     x19, x20              // no, default case?
        csel    x1, x20, x19, hs      // high or same -> yes
        adr     x0, brTable           // address of branch table
        sub     x1, x1, 1             // table offset from 0
        add     x0, x0, x1, lsl 3     // plus address offset in table
        ldr     x0, [x0]              // load address from table
        br      x0                    //     and branch there
one:
        adr     x0, oneMsg            // = 1
        bl      puts                  // write on screen
        b       continue
two:
        adr     x0, twoMsg            // = 2
        bl      puts                  // write on screen
        b       continue
three:
        adr     x0, threeMsg          // = 3
        bl      puts                  // write on screen
        b       continue
default:
        adr     x0, overMsg           // > 3
        bl      puts                  // write on screen
continue:
        add     x19, x19, 1           // i++;
        b       forLoop               // and continue loop
allDone:
        mov     w0, wzr               // return 0
        ldp     x19, x20, [sp, saveReg] // restore reg.
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
