// Subtracts 123 from an integer
        .arch armv8-a
// Useful constants
        .equ    CONSTANT, 123             // number to subtract
        .equ    MAX, 11                   // maximum digits
        .equ    RETURN, '/n'
// Stack frame
        .equ    x, 16
        .equ    y, 20
        .equ    frame, 32
// Code
        .text
        .section  .rodata
        .align  3
prompt:
        .string "Enter an integer: "
plus:
        .string " + "
minus:
        .string " - "
times:
        .string " * "
div:
        .string " / "
remainder:
        .string " % "
equals:
        .string " = "
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        adr     x0, prompt            // ask user for input
        bl      write_str
        bl      get_int               // get x
        str     w0, [sp, x]
        adr     x0, prompt            // ask user for input
        bl      write_str
        bl      get_int               // get y
        str     w0, [sp, y]
// Addition
        ldr     w0, [sp, x]           // print x
        bl      put_int
        adr     x0, plus              // +
        bl      write_str
        ldr     w0, [sp, y]           // y
        bl      put_int
        adr     x0, equals            // =
        bl      write_str
        ldr     w0, [sp, x]
        ldr     w1, [sp, y]
        add     w0, w0, w1            // sum
        bl      put_int
        mov     w0, RETURN
        bl      write_char
// Subtraction
        ldr     w0, [sp, x]           // print x
        bl      put_int
        adr     x0, minus             // -
        bl      write_str
        ldr     w0, [sp, y]           // y
        bl      put_int
        adr     x0, equals            // =
        bl      write_str
        ldr     w0, [sp, x]
        ldr     w1, [sp, y]
        sub     w0, w0, w1            // difference
        bl      put_int
        mov     w0, RETURN
        bl      write_char
// Multiplication
        ldr     w0, [sp, x]           // print x
        bl      put_int
        adr     x0, times             // *
        bl      write_str
        ldr     w0, [sp, y]           // y
        bl      put_int
        adr     x0, equals            // =
        bl      write_str
        ldr     w0, [sp, x]
        ldr     w1, [sp, y]
        mul     w0, w0, w1            // product
        bl      put_int
        mov     w0, RETURN
        bl      write_char

  // Division
        ldr     w0, [sp, x]           // print x
        bl      put_int
        adr     x0, div               // /
        bl      write_str
        ldr     w0, [sp, y]           // y
        bl      put_int
        adr     x0, equals            // =
        bl      write_str
        ldr     w0, [sp, x]
        ldr     w1, [sp, y]
        sdiv    w0, w0, w1            // quotient
        bl      put_int
        mov     w0, RETURN
        bl      write_char

        ldr     w0, [sp, x]           // print x
        bl      put_int
        adr     x0, remainder         // %
        bl      write_str
        ldr     w0, [sp, y]           // y
        bl      put_int
        adr     x0, equals            // =
        bl      write_str
        ldr     w0, [sp, x]
        ldr     w1, [sp, y]
        sdiv    w2, w0, w1            // compute quotient
        msub    w0, w2, w1, w0        //     and remainder
        bl      put_int
        mov     w0, RETURN
        bl      write_char

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
