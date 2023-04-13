// Subtracts 123 from an long integer
        .arch armv8-a
// Useful constants
        .equ    CONSTANT, 123             // number to subtract
        .equ    MAX, 21                   // maximum digits
// Stack frame
        .equ    theInt, 16
        .equ    theString, 20
        .equ    frame, 48
// Code
        .text
        .section  .rodata
        .align  3
prompt:
        .string "Enter a long integer: "
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
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set our frame pointer

        adr     x0, prompt            // ask user for input
        bl      writeStr
        add     x0, sp, theString
        mov     w1, MAX
        bl      readStr

        add     x1, sp, theString     // input
        add     x0, sp, theInt        // place for output
        bl      decToInt              // convert as int

        ldr     w1, [sp, theInt]
        sub     w1, w1, CONSTANT      // subtract our constant
        add     x0, sp, theString     // place for output
        bl      intToDec              // convert to text string

        adr     x0, message           // tell user that
        bl      writeStr
        add     x0, sp, theString     //    this is the result
        bl      writeStr
        adr     x0, newLine
        bl      writeStr

        mov     w0, wzr               // return 0;
        ldp     fp, lr, [sp], frame   // restore fp, lr, sp
        ret                           // back to caller
