        .arch armv8-a
        .file   "hello_world_do.c"
        .text
        .section        .rodata
        .align  3
.LC0:
        .string "Hello, World!\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
        stp     x29, x30, [sp, -32]!
        mov     x29, sp
        adrp    x0, .LC0
        add     x0, x0, :lo12:.LC0
        str     x0, [sp, 24]
.L2:
        mov     x2, 1
        ldr     x1, [sp, 24]
        mov     w0, 1
        bl      write
        ldr     x0, [sp, 24]
        add     x0, x0, 1
        str     x0, [sp, 24]
        ldr     x0, [sp, 24]
        ldrb    w0, [x0]
        cmp     w0, 0
        bne     .L2
        mov     w0, 0
        ldp     x29, x30, [sp], 32
        ret
        .size   main, .-main
        .ident  "GCC: (Debian 12.2.0-14) 12.2.0"
        .section        .note.GNU-stack,"",@progbits
