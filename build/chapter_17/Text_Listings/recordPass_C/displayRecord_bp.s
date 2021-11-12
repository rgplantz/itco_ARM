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
        sub     rsp, 16         ## memory for a record
        mov     rdx, rdi
        mov     eax, esi
        mov     QWORD PTR -16[rbp], rdx ## 8 bytes of record
        mov     DWORD PTR -8[rbp], eax  ## another 4 bytes
        movzx   eax, BYTE PTR -8[rbp]   ## load aChar
        movsx   ecx, al                 ## extend to 32 bits
        mov     edx, DWORD PTR -12[rbp] ## load anInt
        movzx   eax, BYTE PTR -16[rbp]  ## load anotherChar
        movsx   eax, al                 ## extend to 32 bits
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
