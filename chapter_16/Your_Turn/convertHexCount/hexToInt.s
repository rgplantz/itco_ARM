# hexToInt.s
# Converts hex characters in a C string to int.
# Calling sequence:
#   rdi <- pointer to source string
#   rsi <- pointer to long int result
#   returns number of chars converted
        .intel_syntax noprefix

# Stack frame
        .equ    count,-4
        .equ    localSize,-16
# Useful constants
        .equ    GAP,0x07
        .equ    NUMMASK,0x0f    # also works for lower case
        .equ    NUL,0
        .equ    NINE,0x39       # ASCII for '9'
# Code
        .text
        .globl  hexToInt
        .type   hexToInt, @function
hexToInt:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize      # for local var.

        mov     dword ptr count[rbp], 0 # count = 0
        mov     qword ptr [rsi], 0    # initialize to 0
        mov     al, byte ptr [rdi]  # get a char
whileLoop:
        cmp     al, NUL     # end of string?
        je      allDone     # yes, all done
        cmp     al, NINE    # no, is it alpha?
        jbe     numeral     # no, nothing else to do
        sub     al, GAP     # yes, numeral to alpha gap
numeral:
        and     al, NUMMASK # convert to 4-bit int
        sal     qword ptr [rsi], 4  # make room
        or      byte ptr [rsi], al  # insert the 4 bits
        inc     dword ptr count[rbp]    # count++
        inc     rdi         # increment string ptr
        mov     al, byte ptr [rdi]  # next char
        jmp     whileLoop   # and continue
allDone:
        mov     eax, dword ptr count[rbp]   # return count

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

