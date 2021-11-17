# toUpper.s
# Converts alphabetic characters in a C string to upper case.
# Calling sequence:
#   rdi <- pointer to source string
#   rsi <- pointer to destination string
#   returns number of characters processed.
        .intel_syntax noprefix

# Stack frame
        .equ    count,-4
        .equ    localSize,-16
# Useful constants
        .equ    upperMask,0xdf
        .equ    NUL,0
# Code
        .text
        .globl  toUpper
        .type   toUpper, @function
toUpper:
        push    rbp                   # save frame pointer
        mov     rbp, rsp              # set new frame pointer
        add     rsp, localSize        # for local var.
        
        mov     dword ptr count[rbp], 0
whileLoop:
        mov 	  al, byte ptr [rdi]    # char from source
        and     al, upperMask         # no, make sure it's upper
        mov     byte ptr [rsi], al    # char to destination
        cmp     al, NUL               # was it the end?
        je      allDone               # yes, all done
        inc     rdi                   # increment
        inc     rsi                   #      pointers
        inc     dword ptr count[rbp]  #      and counter
        jmp     whileLoop             # continue loop
allDone:
        mov     byte ptr [rsi], al    # finish with NUL
        mov     eax, dword ptr count[rbp] # return count

        mov     rsp, rbp              # restore stack pointer
        pop     rbp                   # and caller frame pointer
        ret
