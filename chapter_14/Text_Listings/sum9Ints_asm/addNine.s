# addNine.s
# Sums nine integer arguments and returns the total.
        .intel_syntax noprefix
# Calling sequence:
#       edi <- one, 32-bit int
#       esi <- two
#       ecx <- three
#       edx <- four
#       r8d <- five
#       r9d <- six
#       push seven
#       push eight
#       push nine
#       returns sum
# Stack frame
#    arguments in stack frame
        .equ    seven,16
        .equ    eight,24
        .equ    nine,32
#    local variables
        .equ    total,-4
        .equ    localSize,-16

# Code
        .text
        .globl  addNine
        .type   addNine, @function
addNine:
        push    rbp             # save frame pointer
        mov     rbp, rsp        # set new frame pointer
        add     rsp, localSize  # for local var.

        add     edi, esi        # add two to one
        add     edi, ecx        # plus three
        add     edi, edx        # plus four
        add     edi, r8d        # plus five
        add     edi, r9d        # plus six
        add     edi, seven[rbp] # plus seven
        add     edi, eight[rbp] # plus eight
        add     edi, nine[rbp]  # plus nine
        mov     total[rbp], edi # save total
	
        mov     eax, total[rbp] # return total;
        mov     rsp, rbp        # restore stack pointer
        pop     rbp             # and caller frame pointer
        ret
