# jumps.s
# Some instructions to illustrate machine code.
        .intel_syntax noprefix
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp         # save caller's frame pointer
        mov     rbp, rsp    # establish our frame pointer

        xor     rax, rbx    # sets status flags
        jne     forward     # test ZF
back:
        mov     r8, r9      # stuff to jump over
        mov     rbx, rcx
forward:
        xor     rax, rbx    # sets status flags
        je      back        # test ZF

        mov     eax, 0      # return 0 to os
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # restore caller's frame pointer
        ret                 # back to caller
