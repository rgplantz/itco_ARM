// Displays ints in array.
// Calling sequence
//    x0 <- address of array
//    w1 <- number of array elements
        .arch armv8-a
// Stack frame
        .equ    save1920, 16
        .equ    save21, 32
        .equ    FRAME, 48
// Code
        .section  .rodata
        .align  3
msg1:
        .string "array["
msg2:
        .string "] = "
        .text
        .align  2
        .global display_array
        .type   display_array, %function
display_array:
        stp     fp, lr, [sp, -FRAME]! // create our stack frame
        mov     fp, sp                // set frame pointer
        stp     x19, x20,  [sp, save1920] // save regs
        str     x21, [sp, save21]

        mov     x19, x0               // array address
        mov     w20, w1               // array size
        mov     w21, wzr              // array index
loop:
        adr     x0, msg1              // start line
        bl      write_str
        mov     w0, w21               // index
        bl      put_int
        adr     x0, msg2              // more text on line
        bl      write_str
        ldr     w0, [x19, w21, uxtw 2]  // current element
        bl      put_int
        mov     w0, '\n'              // finish line
        bl      write_char
        add     w21, w21, 1           // increment index
        cmp     w21, w20              // at end?
        b.lt    loop                  // no, continue filling

        mov     w0, wzr               // return 0;
        ldp     x19, x20,  [sp, save1920] // restore regs
        ldr     x21, [sp, save21]
        ldp     fp, lr, [sp], FRAME   // undo stack frame
        ret
