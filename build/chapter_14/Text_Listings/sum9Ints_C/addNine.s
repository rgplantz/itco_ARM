        .arch armv8-a
        .file   "addNine.c"
        .text
        .align  2
        .global addNine
        .type   addNine, %function
addNine:
.LFB0:
        sub     sp, sp, #48
.LCFI0:
        str     w0, [sp, 28]
        str     w1, [sp, 24]
        str     w2, [sp, 20]
        str     w3, [sp, 16]
        str     w4, [sp, 12]
        str     w5, [sp, 8]
        str     w6, [sp, 4]
        str     w7, [sp]
        ldr     w1, [sp, 28]
        ldr     w0, [sp, 24]
        add     w1, w1, w0
        ldr     w0, [sp, 20]
        add     w1, w1, w0
        ldr     w0, [sp, 16]
        add     w1, w1, w0
        ldr     w0, [sp, 12]
        add     w1, w1, w0
        ldr     w0, [sp, 8]
        add     w1, w1, w0
        ldr     w0, [sp, 4]
        add     w1, w1, w0
        ldr     w0, [sp]
        add     w0, w1, w0
        ldr     w1, [sp, 48]
        add     w0, w1, w0
        str     w0, [sp, 44]
        ldr     w0, [sp, 44]
        add     sp, sp, 48
.LCFI1:
        ret
.LFE0:
        .size   addNine, .-addNine
        .section        .eh_frame,"a",@progbits
.Lframe1:
        .4byte  .LECIE1-.LSCIE1
.LSCIE1:
        .4byte  0
        .byte   0x3
        .string "zR"
        .uleb128 0x1
        .sleb128 -8
        .uleb128 0x1e
        .uleb128 0x1
        .byte   0x1b
        .byte   0xc
        .uleb128 0x1f
        .uleb128 0
        .align  3
.LECIE1:
.LSFDE1:
        .4byte  .LEFDE1-.LASFDE1
.LASFDE1:
        .4byte  .LASFDE1-.Lframe1
        .4byte  .LFB0-.
        .4byte  .LFE0-.LFB0
        .uleb128 0
        .byte   0x4
        .4byte  .LCFI0-.LFB0
        .byte   0xe
        .uleb128 0x30
        .byte   0x4
        .4byte  .LCFI1-.LCFI0
        .byte   0xe
        .uleb128 0
        .align  3
.LEFDE1:
        .ident  "GCC: (Debian 10.2.1-6) 10.2.1 20210110"
        .section        .note.GNU-stack,"",@progbits
