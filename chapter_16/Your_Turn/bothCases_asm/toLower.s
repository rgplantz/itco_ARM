# toLower.s
# Converts alphabetic characters in a C string to lower case.
# Calling sequence:
#   rdi <- pointer to source string
#   rsi <- pointer to destination string
#   returns number of characters processed.
        .intel_syntax noprefix

# Stack frame
        .equ    count,-4
        .equ    localSize,-16
# Useful constants
        .equ    lowerMask,0x20
        .equ    NUL,0
# Code
        .text
        .globl  toLower
        .type   toLower, @function
toLower:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize      # for local var.
        
        mov     dword ptr count[rbp], 0
dowhileLoop:
        mov 	  al, byte ptr [rdi]  # char from source
        mov     byte ptr [rsi], al  # char to destination
        cmp     al, NUL             # was it the end?
        je      allDone             # yes, all done
        or      byte ptr [rsi], lowerMask # no, make sure it's lower
        inc     rdi         # increment
        inc     rsi         #      pointers
        inc     dword ptr count[rbp]    # and counter
        jmp     dowhileLoop # continue loop
allDone:
        mov     eax, dword ptr count[rbp]   # return count

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

