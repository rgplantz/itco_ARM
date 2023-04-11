// Subtracts 123 from an integer
        .arch armv8-a
// Useful constants
        .equ    CONSTANT, 123             // number to subtract
        .equ    MAX, 11                   // maximum digits
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
newLine:
        .string "\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        adr     x0, prompt            // ask user for input
        bl      writeStr
        bl      getInt                // get x
        str     w0, [sp, x]
        adr     x0, prompt            // ask user for input
        bl      writeStr
        bl      getInt                // get y
        str     w0, [sp, y]
// Addition
        ldr     w0, [sp, x]           // print x
        bl      putInt
        adr     x0, plus              // +
        bl      writeStr
        ldr     w0, [sp, y]           // y
        bl      putInt
        adr     x0, equals            // =
        bl      writeStr
        ldr     w0, [sp, x]
        ldr     w1, [sp, y]
        add     w0, w0, w1            // sum
        bl      putInt
        adr     x0, newLine
        bl      writeStr
// Subtraction
        ldr     w0, [sp, x]           // print x
        bl      putInt
        adr     x0, minus             // -
        bl      writeStr
        ldr     w0, [sp, y]           // y
        bl      putInt
        adr     x0, equals            // =
        bl      writeStr
        ldr     w0, [sp, x]
        ldr     w1, [sp, y]
        sub     w0, w0, w1            // difference
        bl      putInt
        adr     x0, newLine
        bl      writeStr
// Multiplication
        ldr     w0, [sp, x]           // print x
        bl      putInt
        adr     x0, times             // *
        bl      writeStr
        ldr     w0, [sp, y]           // y
        bl      putInt
        adr     x0, equals            // =
        bl      writeStr
        ldr     w0, [sp, x]
        ldr     w1, [sp, y]
        mul     w0, w0, w1            // product
        bl      putInt
        adr     x0, newLine
        bl      writeStr

  // Division
        ldr     w0, [sp, x]           // print x
        bl      putInt
        adr     x0, div               // /
        bl      writeStr
        ldr     w0, [sp, y]           // y
        bl      putInt
        adr     x0, equals            // =
        bl      writeStr
        ldr     w0, [sp, x]
        ldr     w1, [sp, y]
        sdiv    w0, w0, w1            // quotient
        bl      putInt
        adr     x0, newLine
        bl      writeStr

        ldr     w0, [sp, x]           // print x
        bl      putInt
        adr     x0, remainder         // %
        bl      writeStr
        ldr     w0, [sp, y]           // y
        bl      putInt
        adr     x0, equals            // =
        bl      writeStr
        ldr     w0, [sp, x]
        ldr     w1, [sp, y]
        sdiv    w2, w0, w1            // compute quotient
        msub    w0, w2, w1, w0        //     and remainder
        bl      putInt
        adr     x0, newLine
        bl      writeStr

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
