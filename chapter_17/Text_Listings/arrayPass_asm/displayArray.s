// Displays ints in array.
// Calling sequence
//    x0 <- address of array
//    w1 <- number of array elements
        .arch armv8-a
// Stack frame
        .equ    save1920, 0
        .equ    save21, 16
        .equ    frame, 32
// Code
        .section        .rodata
        .align  3
msg1:
        .string "intArray["
msg2:
        .string "] = "
newline:
        .string "\n"
        .text
        .align  2
        .global displayArray
        .type   displayArray, %function
displayArray:
        stp     fp, lr, [sp, -frame]! // create our stack frame
        mov     fp, sp                // set frame pointer
        stp     x19, x20,  [sp, save1920] // save regs
        str     x21, [sp, save21]

        mov     x19, x0               // array address
        mov     w20, w1               // array size
        mov     w21, wzr              // array index
displayLoop:
        adr     x0, msg1              // start line
        bl      writeStr
        mov     w0, w21               // index
        bl      putInt
        adr     x0, msg2              // more text on line
        bl      writeStr
        ldr     x0, [x0, w2, uxtw 2]  // current element
        bl      putInt
        adr     x0, newline           // finish line
        bl      writeStr
        add     w21, w21, 1           // increment index
        cmp     w21, w20              // at end?
        b.lt    displayLoop           // no, continue filling

        mov     w0, wzr               // return 0;
        ldr     x19, x20,  [sp, save1920] // restore regs
        ldr     x21, [sp, save21]
        ldp     fp, lr, [sp], frame   // undo stack frame
        ret
