# fraction_construct.s
# Initializes fraction to 0/1
# Calling sequence:
#   rdi <- address of object
        .intel_syntax noprefix
        .include    "fraction"
# Code
        .text
        .globl  fraction_construct
        .type   fraction_construct, @function
fraction_construct:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        mov     dword ptr num[rdi], 0   # initialize
        mov     dword ptr den[rdi], 1   #     fraction
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

