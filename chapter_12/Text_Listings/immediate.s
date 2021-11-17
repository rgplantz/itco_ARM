# immediate.s
# Some instructions to illustrate machine code.
        .intel_syntax noprefix
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp         # save caller's frame pointer
        mov     rbp, rsp    # establish our frame pointer
        
        mov     al, 0xab    # 8-bit immediate
        mov     ax, 0xabcd  # 16-bit immediate
        mov     eax, 0xabcdef12  # 32-bit immediate
        mov     rax, 0xabcdef12  #    to 64-bit reg
        mov     rax, 0xabcdef0123456789  # 64-bit immediate

        mov     eax, 0      # return 0 to os
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         #   and frame pointer
        ret                 # back to caller
