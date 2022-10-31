// switch.s
// Three-way selection
        .arch armv8-a
// Useful constants
        .equ    NTIMES, 10          // number of loops
// Stack frame
        .equ    save19, 28
        .equ    frame, 32
// Code
        .text
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
// Program code
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
        adr     x0, oneMsg            // 
        bl      puts                  // print message
        b       continue              // skip else part
continue:
        add     w19, w19, 1           // i++;
        b       forLoop               // and continue loop
allDone:
        mov     w0, wzr               // return 0
        ldr     w19, [sp, save19]     // restore reg.
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
