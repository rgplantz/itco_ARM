        .arch armv8-a
        .file   "sum9Ints.c"
        .text
        .section        .rodata
        .align  3
.LC0:
        .string "The sum is %i\n"
        .text
        .align  2
        .global main
        .type   main, %function
main:
.LFB0:
        sub     sp, sp, #80         @@ local vars and 9th arg
.LCFI0:
        stp     x29, x30, [sp, 16]  @@ save fp, sp
.LCFI1:
        add     x29, sp, 16         @@ set fp
        mov     w0, 1
        str     w0, [sp, 76]        @@ a = 1;
        mov     w0, 2
        str     w0, [sp, 72]        @@ b = 2;
        mov     w0, 3
        str     w0, [sp, 68]        @@ c = 3;
        mov     w0, 4
        str     w0, [sp, 64]        @@ d = 4;
        mov     w0, 5
        str     w0, [sp, 60]        @@ e = 5;
        mov     w0, 6
        str     w0, [sp, 56]        @@ f = 6;
        mov     w0, 7
        str     w0, [sp, 52]        @@ g = 7;
        mov     w0, 8
        str     w0, [sp, 48]        @@ h = 8;
        mov     w0, 9
        str     w0, [sp, 44]        @@ i = 9;
        ldr     w0, [sp, 44]
        str     w0, [sp]            @@ i at top of stack
        ldr     w7, [sp, 48]        @@ load h
        ldr     w6, [sp, 52]
        ldr     w5, [sp, 56]
        ldr     w4, [sp, 60]
        ldr     w3, [sp, 64]
        ldr     w2, [sp, 68]
        ldr     w1, [sp, 72]
        ldr     w0, [sp, 76]        @@ load a
        bl      addNine
        str     w0, [sp, 40]        @@ total = addNine(a, b, c, d, e, f, g, h, i);
        ldr     w1, [sp, 40]        @@ load total
        adrp    x0, .LC0            @@ page of format string
        add     x0, x0, :lo12:.LC0  @@ plus location in page
        bl      printf
        mov     w0, 0
        ldp     x29, x30, [sp, 16]
        add     sp, sp, 80
.LCFI2:
        ret
.LFE0:
        .size   main, .-main
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
        .uleb128 0x50
        .byte   0x4
        .4byte  .LCFI1-.LCFI0
        .byte   0x9d
        .uleb128 0x8
        .byte   0x9e
        .uleb128 0x7
        .byte   0x4
        .4byte  .LCFI2-.LCFI1
        .byte   0xdd
        .byte   0xde
        .byte   0xe
        .uleb128 0
        .align  3
.LEFDE1:
        .ident  "GCC: (Debian 10.2.1-6) 10.2.1 20210110"
        .section        .note.GNU-stack,"",@progbits
