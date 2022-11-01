// switch.s
// Three-way selection
        .arch armv8-a
// Useful names
        .equ    NTIMES, 10          // number of loops
// Stack frame
        .equ    save19, 28
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
        .quad   one                 // addresses where messages
        .quad   two                 // are printed
        .quad   three
        .quad   over
        .quad   over
        .quad   over
        .quad   over
        .quad   over
        .quad   over                // need an entry for
        .quad   over                // each possibility
// Code
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer
        str     w19, [sp, save19]     // save for i local var.
        mov     w19, 0                // i = 0
forLoop:
        mov     w0, NTIMES            // total number of times
        cmp     w19, w0               // is i at end?
        b.hs    allDone               // yes
        adr     x0, brTable           // no, address of branch table
        add     x0, x0, x19, lsl 3    // plus offset in table
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
over:
        adr     x0, overMsg           // > 3
        bl      puts                  // write on screen
continue:
        add     w19, w19, 1           // i++;
        b       forLoop               // and continue loop
allDone:
        mov     w0, wzr               // return 0
        ldr     w19, [sp, save19]     // restore reg.
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
