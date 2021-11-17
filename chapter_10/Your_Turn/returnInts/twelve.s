# twelve.s
# Returns twelve.
        .intel_syntax noprefix
        .text
        .globl  twelve
        .type   twelve, @function
twelve:
        push    rbp         # save caller's frame pointer
        mov     rbp, rsp    # establish our frame pointer

        mov     eax, 12     # return 12;

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # restore caller's frame pointer
        ret                 # back to caller
