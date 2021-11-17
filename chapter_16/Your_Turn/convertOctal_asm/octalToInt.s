# octalToInt.s
# Converts octal characters in a C string to int.
# Calling sequence:
#   rdi <- pointer to source string
#   rsi <- pointer to long int result
#   returns number of chars converted
        .intel_syntax noprefix

# Stack frame
        .equ    count,-4
        .equ    localSize,-16
# Useful constants
        .equ    NUMMASK,0x07
        .equ    NUL,0
# Code
        .text
        .globl  octalToInt
        .type   octalToInt, @function
octalToInt:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize      # for local var.

        mov     dword ptr count[rbp], 0 # count = 0
        mov     qword ptr [rsi], 0    # initialize to 0
        mov     al, byte ptr [rdi]  # get a char
whileLoop:
        cmp     al, NUL     # end of string?
        je      allDone     # yes, all done
        and     al, NUMMASK # convert to 4-bit int
        sal     qword ptr [rsi], 3  # make room
        or      byte ptr [rsi], al  # insert the 3 bits
        inc     dword ptr count[rbp]    # count++
        inc     rdi         # increment string ptr
        mov     al, byte ptr [rdi]  # next char
        jmp     whileLoop   # and continue
allDone:
        mov     eax, dword ptr count[rbp]   # return count

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

