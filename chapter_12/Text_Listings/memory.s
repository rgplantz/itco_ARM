# memory.s
# Some instructions to illustrate machine code.
        .intel_syntax noprefix
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp         # save caller's frame pointer
        mov     rbp, rsp    # establish our frame pointer
        sub     rsp, 48     # local variables
        
        mov     rcx, 5              # for indexing
        mov     eax, [rbp]          # indirect
        mov     eax, -48[rbp]       # indirect + offset  
        mov     eax, -48[rbp+rcx]   # indirect + offset and index 
        mov     eax, -48[rbp+4*rcx] #      and scaled index 
       
        mov     eax, 0      # return 0 to os
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         #   and frame pointer
        ret                 # back to caller
