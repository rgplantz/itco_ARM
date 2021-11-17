# addNine.s
# Sums nine integer arguments and returns the total.
        .intel_syntax noprefix
# Calling sequence:
#       push one
#       push two
#       push three
#       push four
#       push five
#       push six
#       push seven
#       push eight
#       push nine
#       returns sum
# Stack frame
#    arguments in stack frame
        .equ    one,16
        .equ    two,24
        .equ    three,32
        .equ    four,40
        .equ    five,48
        .equ    six,56
        .equ    seven,64
        .equ    eight,72
        .equ    nine,80
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

        mov     eax, one[rbp]   # retrieve one
        add     eax, two[rbp]   # add two
        add     eax, three[rbp] # plus three
        add     eax, four[rbp]  # plus four
        add     eax, five[rbp]  # plus five
        add     eax, six[rbp]   # plus six
        add     eax, seven[rbp] # plus seven
        add     eax, eight[rbp] # plus eight
        add     eax, nine[rbp]  # plus nine

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller framee pointer
        ret

