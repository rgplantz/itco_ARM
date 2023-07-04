// switch.s
// Three-way selection
        .arch armv8-a
// Useful names
        .equ    NTIMES, 10            // number of loops
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
// Program code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        str     x19, [sp, saveReg]    // save for caller
        mov     x19, 1                // i = 1
forLoop:
        cmp     x19, NTIMES           // is i at end?
        b.hi    allDone               // yes, leave loop
        cmp     x19, 1                // one?
        b.eq    one                   // yes, go there
        cmp     x19, 2
        b.eq    two
        cmp     x19, 3
        b.eq    three
        adr     x0, overMsg           // default case
        bl      puts                  // write on screen
        b       continue              // skip over others
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
continue:
        add     x19, x19, 1           // i++;
        b       forLoop               // and continue loop
allDone:
        mov     w0, wzr               // return 0
        ldp     x19, x20, [sp, saveReg] // restore reg.
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
