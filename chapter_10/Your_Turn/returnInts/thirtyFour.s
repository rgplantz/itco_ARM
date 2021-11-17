# thirtyFour.s
# Returns 34.
        .intel_syntax noprefix
        .text
        .globl  thirtyFour
        .type   thirtyFour, @function
thirtyFour:
        push    rbp         # save caller's frame pointer
        mov     rbp, rsp    # establish our frame pointer

        mov     eax, 34     # return 34;

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # restore caller's frame pointer
        ret                 # back to caller
