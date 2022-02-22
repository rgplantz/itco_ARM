// twiceIndex.s
// Stores 2 time element number in each array element.
// Calling sequence
//    x0 <- address of array
//    w1 <- number of array elements
        .arch armv8-a
// Stack frame
        .equ    theArray,0
        .equ    nElements,8
        .equ    frameSize,48
// Code
        .section        .rodata
        .align  3
msg1:
        .string "intArray["
        .align  3
msg2:
        .string "] = "
        .align  3
newline:
        .string "\n"
        .text
        .align  2
        .global displayArray
        .type   displayArray, %function
displayArray:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp

        mov     w2, wzr           // i = 0;
displayLoop:
        add     w3, w2, w2        // 2 times i
        str     w3, [x0, x2, lsl 2]   // current element address        
        add     w2, w2, 1         // i++;
        cmp     w2, w1            // at end?
        b.ge    displayLoop          // no, continue filling

        str     x0, [sp, 24]
        str     w1, [sp, 20]
        str     wzr, [sp, 44]
        b       .L2
.L3:
        adrp    x0, .LC0
        add     x0, x0, :lo12:.LC0
        bl      writeStr
        ldr     w0, [sp, 44]
        bl      putInt
        adrp    x0, .LC1
        add     x0, x0, :lo12:.LC1
        bl      writeStr
        ldrsw   x0, [sp, 44]
        lsl     x0, x0, 2
        ldr     x1, [sp, 24]
        add     x0, x1, x0
        ldr     w0, [x0]
        bl      putInt
        adrp    x0, .LC2
        add     x0, x0, :lo12:.LC2
        bl      writeStr
        ldr     w0, [sp, 44]
        add     w0, w0, 1
        str     w0, [sp, 44]
.L2:
        ldr     w1, [sp, 44]
        ldr     w0, [sp, 20]
        cmp     w1, w0
        blt     .L3
        nop
        nop
        ldp     x29, x30, [sp], 48
        ret
        .size   displayArray, .-displayArray
        .ident  "GCC: (Debian 10.2.1-6) 10.2.1 20210110"
        .section        .note.GNU-stack,"",@progbits
