        .file   "displayRecord.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "%c, %i, %c\n"
        .text
        .globl  displayRecord
        .type   displayRecord, @function
displayRecord:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR -8[rbp], rdi
        movzx   eax, BYTE PTR -7[rbp]
        movsx   ecx, al
        mov     edx, DWORD PTR -4[rbp]
        movzx   eax, BYTE PTR -8[rbp]
        movsx   eax, al
        mov     esi, eax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        nop
        leave
        ret
        .size   displayRecord, .-displayRecord
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
