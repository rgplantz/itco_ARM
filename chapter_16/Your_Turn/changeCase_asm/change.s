# change.s
# Changes case of alphabetic characters in a C string.
# Calling sequence:
#   rdi <- pointer to source string
#   rsi <- pointer to destination string
#   returns number of characters processed.
        .intel_syntax noprefix

# Stack frame
        .equ    count,-4
        .equ    localSize,-16
# Useful constants
        .equ    changeMask,0x20
        .equ    NUL,0
# Code
        .text
        .globl  change
        .type   change, @function
change:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize      # for local var.
        
        mov     dword ptr count[rbp], 0
dowhileLoop:
        mov 	  al, byte ptr [rdi]  # char from source
        mov     byte ptr [rsi], al  # char to destination
        cmp     al, NUL             # was it the end?
        je      allDone             # yes, all done
        xor     byte ptr [rsi], changeMask # no, change to other
        inc     rdi         # increment
        inc     rsi         #      pointers
        inc     dword ptr count[rbp]    # and counter
        jmp     dowhileLoop # continue loop
allDone:
        mov     eax, dword ptr count[rbp]   # return count

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

