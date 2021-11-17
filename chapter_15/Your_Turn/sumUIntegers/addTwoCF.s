# addTwoCF.s
# Adds two unsigned integers and returns CF
# Calling sequence:
#       edi <- x, 32-bit unsigned int
#       esi <- y, 32-bit unisgned int
#       rdx <- &z, place to store sum
#       returns value of CF
        .intel_syntax noprefix

# Code
        .text
        .globl  addTwoCF
        .type   addTwoCF, @function
addTwoCF:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer

        add     edi, esi    # x + y
        setc    al          # CF T or F
        movzx   eax, al     # convert to int
        mov     [rdx] , edi # *c = sum
        
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

