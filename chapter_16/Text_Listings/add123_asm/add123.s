// add123.s
// Adds 123 to an unsigned integer
        .arch armv8-a
// Useful constants
        .equ    CONSTANT,123              // number to add
        .equ    MAX,11                    // maximum digits
// Stack frame
        .equ    theInt,28
        .equ    theString,32
        .equ    frameSize,48
// Code
        .text
        .section        .rodata
        .align  3
prompt:
        .string "Enter an unsigned integer: "
        .align  3
message:
        .string "The result is: "
        .align  3
newLine:
        .string "\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     fp, lr, [sp, -frameSize]!
        mov     fp, sp
        adrp    x0, prompt
        add     x0, x0, :lo12:prompt
        bl      writeStr
        add     x0, sp, theString
        mov     w1, MAX
        bl      readStr
        add     x1, sp, theString
        add     x0, sp, theInt
        bl      decToUInt
        ldr     w1, [sp, theInt]
        add     w1, w1, CONSTANT
        add     x0, sp, theString
        bl      intToUDec
        adrp    x0, message
        add     x0, x0, :lo12:message
        bl      writeStr
        add     x0, sp, theString
        bl      writeStr
        adrp    x0, newLine
        add     x0, x0, :lo12:newLine
        bl      writeStr
        mov     w0, 0
        ldp     x29, x30, [sp], frameSize
        ret
