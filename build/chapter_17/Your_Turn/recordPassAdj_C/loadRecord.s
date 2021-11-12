        .file   "loadRecord.c"
        .intel_syntax noprefix
        .text
        .globl  loadRecord
        .type   loadRecord, @function
loadRecord:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -8[rbp], rdi
        mov     DWORD PTR -16[rbp], edx
        mov     eax, ecx
        mov     edx, esi
        mov     BYTE PTR -12[rbp], dl
        mov     BYTE PTR -20[rbp], al
        mov     rax, QWORD PTR -8[rbp]
        movzx   edx, BYTE PTR -12[rbp]
        mov     BYTE PTR [rax], dl
        mov     rax, QWORD PTR -8[rbp]
        mov     edx, DWORD PTR -16[rbp]
        mov     DWORD PTR 4[rax], edx
        mov     rax, QWORD PTR -8[rbp]
        movzx   edx, BYTE PTR -20[rbp]
        mov     BYTE PTR 1[rax], dl
        mov     eax, 0
        pop     rbp
        ret
        .size   loadRecord, .-loadRecord
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
