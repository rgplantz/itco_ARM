# fraction_destruct.s
# Nothing to do here
# Calling sequence:
#   rdi <- address of object
        .intel_syntax noprefix
        .include    "fraction"
# Code
        .text
        .globl  fraction_destruct
        .type   fraction_destruct, @function
fraction_destruct:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
    # Has nothing to do
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

