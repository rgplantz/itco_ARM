# addressing.s
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
        mov     edi, r8d    # 32 bits, 64-bit register
        mov     rax, rcx    # 64 bits

        mov     al, 0xab    # 8-bit immediate
        mov     ax, 0xabcd  # 16-bit immediate
        mov     eax, 0xabcdef12  # 32-bit immediate
        mov     rax, 0xabcdef12  #    to 64-bit reg
        mov     rax, 0xabcdef12345678  # 64-bit immediate

        mov     rcx, 5              # for indexing
        mov     eax, [rbp]          # indirect
        mov     eax, 15[rbp]        # indirect + offset  
        mov     eax, 15[rcx+rbp]    # indirect + offset and index 
        mov     eax, 15[4*rcx+rbp]  #      and scaled index 
       
        mov     eax, 0      # return 0 to os
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # restore caller's frame pointer
        ret                 # back to caller
