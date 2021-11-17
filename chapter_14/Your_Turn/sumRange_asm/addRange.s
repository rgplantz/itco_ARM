# addRange.s
# Sums all integers between two integers and returns the total.
        .intel_syntax noprefix
# Calling sequence:
#       edi <- lower number
#       esi <- higher number
#       returns sum

# Code
        .text
        .globl  addRange
        .type   addRange, @function
addRange:
        push    rbp             # save frame pointer
        mov     rbp, rsp        # set new frame pointer

        mov     eax, edi        # start with lower number
while:
        cmp     edi, esi        # are we there?
        jge     allDone         # yes, all done
        inc     edi             # no, next integer
        add     eax, edi        # add it in to total
        jmp     while           # and continue
allDone:
        mov     rsp, rbp        # restore stack pointer
        pop     rbp             # and caller frame pointer
        ret

