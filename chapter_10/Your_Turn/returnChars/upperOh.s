# upperOh.s
# Returns 'O'.
        .intel_syntax noprefix
        .text
        .globl  upperOh
        .type   upperOh, @function
upperOh:
        push    rbp         # save caller's frame pointer
        mov     rbp, rsp    # establish our frame pointer

        mov     eax, 'O'    # return 'O';

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # restore caller's frame pointer
        ret                 # back to caller
