// Add eleven integers and return sum.
// Calling sequence:
//    w0 through w7 <- 8 integers
//    [sp] <- integer
//    [sp+8] <- integer
//    [sp+16] <- integer
//    returns sum
        .arch armv8-a
// Stack frame
        .equ    eight, 16
        .equ    seven, 20
        .equ    six, 24
        .equ    five, 28
        .equ    four, 32
        .equ    three, 36
        .equ    two, 40
        .equ    one, 44
        .equ    sum, 60
        .equ    FRAME, 64             // end of our frame
        .equ    nine, 64              // stack args.
        .equ    ten, 72
        .equ    eleven, 80
// Constant data
        .section  .rodata
        .align  3
msg:
        .string "Added them"
        .text
        .align  2
        .global addEleven
        .type   addEleven, %function
addEleven:
        stp     fp, lr, [sp, -FRAME]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        str     w0, [sp, one]         // save register args.
        str     w1, [sp, two]
        str     w2, [sp, three]
        str     w3, [sp, four]
        str     w4, [sp, five]
        str     w5, [sp, six]
        str     w6, [sp, seven]
        str     w7, [sp, eight]

        ldr     w1, [sp, one]         // load args.             
        ldr     w0, [sp, two]
        add     w1, w1, w0            //      and sum them
        ldr     w0, [sp, three]
        add     w1, w1, w0
        ldr     w0, [sp, four]
        add     w1, w1, w0
        ldr     w0, [sp, five]
        add     w1, w1, w0
        ldr     w0, [sp, six]
        add     w1, w1, w0
        ldr     w0, [sp, seven]
        add     w1, w1, w0
        ldr     w0, [sp, eight]
        add     w1, w1, w0
        ldr     w0, [sp, nine]
        add     w1, w1, w0
        ldr     w0, [sp, ten]
        add     w1, w1, w0
        ldr     w0, [sp, eleven]
        add     w1, w1, w0
        str     w1, [sp, sum]         // store sum
        adr     x0, msg               // tell user we're done
        bl      puts

        ldr     w0, [sp, sum]         // return the sum
        ldp     fp, lr, [sp], FRAME   // restore fp, lr, sp
        ret                           // back to caller
