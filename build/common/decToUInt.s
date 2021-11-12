# decToUInt.s
# Converts decimal character string to unsigned 32-bit int.
# Calling sequence:
#   rdi <- pointer to source string
#   rsi <- pointer to int result
#   returns 0
        .intel_syntax noprefix

# Useful constants
        .equ    DECIMAL,10
        .equ    NUMMASK,0x0f
        .equ    NUL,0

# Code
        .text
        .globl  decToUInt
        .type   decToUInt, @function
decToUInt:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer

        mov     dword ptr [rsi], 0  # result = 0
        mov     al, byte ptr [rdi]  # get a char
whileLoop:
        cmp     al, NUL     # end of string?
        je      allDone     # yes, all done
        and     eax, NUMMASK    # no, 4-bits -> 32-bit int
        mov     ecx, dword ptr [rsi]    # current result
        imul    ecx, ecx, DECIMAL       # next base position
        add     ecx, eax    # add the new value
        mov     dword ptr [rsi], ecx    # update result
        inc     rdi         # increment string ptr
        mov     al, byte ptr [rdi]  # next char
        jmp     whileLoop   # and continue
allDone:
        mov     dword ptr [rsi], ecx    # output result
        mov     eax, 0      # return 0

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

