# tilde.s
# Returns '~'.
        .intel_syntax noprefix
        .text
        .globl  tilde
        .type   tilde, @function
tilde:
        push    rbp         # save caller's frame pointer
        mov     rbp, rsp    # establish our frame pointer

        mov     eax, '~'    # return '~';

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # restore caller's frame pointer
        ret                 # back to caller
