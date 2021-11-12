        .file   "loadRecord.c"
        .intel_syntax noprefix
        .text
        .globl  loadRecord
        .type   loadRecord, @function
loadRecord:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -8[rbp], rdi  ## save address of record
        mov     DWORD PTR -16[rbp], edx ## save y
        mov     eax, ecx
        mov     edx, esi
        mov     BYTE PTR -12[rbp], dl   ## save x
        mov     BYTE PTR -20[rbp], al   ## save z
        mov     rax, QWORD PTR -8[rbp]  ## load address of record
        movzx   edx, BYTE PTR -12[rbp]  ## load x
        mov     BYTE PTR [rax], dl      ## store x
        mov     rax, QWORD PTR -8[rbp]  ## load address of record
        mov     edx, DWORD PTR -16[rbp] ## load y
        mov     DWORD PTR 4[rax], edx   ## store y
        mov     rax, QWORD PTR -8[rbp]  ## load address of record
        movzx   edx, BYTE PTR -20[rbp]  ## load z
        mov     BYTE PTR 8[rax], dl     ## store z
        mov     eax, 0
        pop     rbp
        ret
        .size   loadRecord, .-loadRecord
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
