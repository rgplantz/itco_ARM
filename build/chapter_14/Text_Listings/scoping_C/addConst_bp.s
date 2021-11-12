        .file   "addConst.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "In addConst:%8i %8i %8i\n"
        .text
        .globl  addConst
        .type   addConst, @function
addConst:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR -4[rbp], 78       ## int x = INITx;
        add     DWORD PTR -4[rbp], 1000     ## x += ADDITION;
        mov     eax, DWORD PTR y.2319[rip]  ## load y
        add     eax, 1000                   ## y += ADDITION;
        mov     DWORD PTR y.2319[rip], eax  ## store new y
        mov     eax, DWORD PTR z[rip]       ## load z
        add     eax, 1000                   ## z += ADDITION;
        mov     DWORD PTR z[rip], eax       ## store new z
        mov     ecx, DWORD PTR z[rip]
        mov     edx, DWORD PTR y.2319[rip]
        mov     eax, DWORD PTR -4[rbp]
        mov     esi, eax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        nop
        leave
        ret
        .size   addConst, .-addConst
        .data
        .align 4
        .type   y.2319, @object
        .size   y.2319, 4
y.2319:
        .long   90                    ## static int y = INITy;
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
