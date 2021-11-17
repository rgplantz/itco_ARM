# fraction_add.s
# Adds integer to fraction
# Calling sequence:
#   rdi <- pointer to object
#   esi <- int to add
        .intel_syntax noprefix
        .include    "fraction"

# Code
        .text
        .globl  fraction_add
        .type   fraction_add, @function
fraction_add:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        mov     eax, den[rdi]   
        imul    eax, esi    # denominator X int to add
        add     num[rdi], eax  
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

