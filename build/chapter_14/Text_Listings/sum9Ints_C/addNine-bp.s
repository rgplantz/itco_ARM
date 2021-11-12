        .file   "addNine.c"
        .intel_syntax noprefix
        .text
        .globl  addNine
        .type   addNine, @function
addNine:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR -20[rbp], edi   ## store a locally
        mov     DWORD PTR -24[rbp], esi   ## store b locally
        mov     DWORD PTR -28[rbp], edx   ## store c locally
        mov     DWORD PTR -32[rbp], ecx   ## store d locally
        mov     DWORD PTR -36[rbp], r8d   ## store e locally
        mov     DWORD PTR -40[rbp], r9d   ## store f locally
        mov     edx, DWORD PTR -20[rbp]   ## sum = a
        mov     eax, DWORD PTR -24[rbp]
        add     edx, eax                  ## sum += b
        mov     eax, DWORD PTR -28[rbp]
        add     edx, eax                  ## sum += c
        mov     eax, DWORD PTR -32[rbp]
        add     edx, eax                  ## sum += d
        mov     eax, DWORD PTR -36[rbp]
        add     edx, eax                  ## sum += e
        mov     eax, DWORD PTR -40[rbp]
        add     edx, eax                  ## sum += f
        mov     eax, DWORD PTR 16[rbp]  ## from arg list
        add     edx, eax                  ## sum += g
        mov     eax, DWORD PTR 24[rbp]
        add     edx, eax                  ## sum += h
        mov     eax, DWORD PTR 32[rbp]
        add     eax, edx                  ## sum += i
        mov     DWORD PTR -4[rbp], eax
        mov     eax, DWORD PTR -4[rbp]
        pop     rbp
        ret
        .size   addNine, .-addNine
        .ident  "GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
        .section        .note.GNU-stack,"",@progbits
