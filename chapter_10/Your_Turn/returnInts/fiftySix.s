# fiftySix.s
# Returns 56.
        .intel_syntax noprefix
        .text
        .globl  fiftySix
        .type   fiftySix, @function
fiftySix:
        push    rbp         # save caller's frame pointer
        mov     rbp, rsp    # establish our frame pointer

        mov     eax, 56     # return 56;

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # restore caller's frame pointer
        ret                 # back to caller
