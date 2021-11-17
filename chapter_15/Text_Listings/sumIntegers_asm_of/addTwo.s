# addTwo.s
# Adds two integers and returns OF
# Calling sequence:
#       edi <- x, 32-bit int
#       esi <- y, 32-bit int
#       rdx <- &z, place to store sum
#       returns value of OF
        .intel_syntax noprefix

# Code
        .text
        .globl  addTwo
        .type   addTwo, @function
addTwo:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer

        add     edi, esi    # x + y
        seto    al          # OF T or F
        movzx   eax, al     # convert to int
        mov     [rdx] , edi # *c = sum
        
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

