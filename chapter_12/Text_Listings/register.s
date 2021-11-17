# register.s
# Some instructions to illustrate machine code.
        .intel_syntax noprefix
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp         # save caller's frame pointer
        mov     rbp, rsp    # establish our frame pointer
        
        mov     eax, ecx    # 32 bits, low reg codes
        mov     edi, esi    # highest reg codes
        mov     ax, cx      # 16 bits
        mov     al, cl      # 8 bits
        mov     eax, r8d    # 32 bits, 64-bit register
        mov     rax, rcx    # 64 bits

        mov     eax, 0      # return 0 to os
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         #   and frame pointer
        ret                 # back to caller
