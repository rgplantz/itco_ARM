# intToUDec.s
# Creates character string that represents unsigned 32-bit int.
# Calling sequence:
#   rdi <- pointer to resulting string
#   esi <- unsigned int
        .intel_syntax noprefix

# Stack frame
        .equ    reverseArray,-32
        .equ    canary,-8
        .equ    localSize,-32
# Useful constants
        .equ    DECIMAL,10
        .equ    ASCII,0x30
        .equ    NUL,0

# Code
        .text
        .globl  intToUDec
        .type   intToUDec, @function
intToUDec:
        push    rbp                     # save frame pointer
        mov     rbp, rsp                # set new frame pointer
        add     rsp, localSize          # for local var.
        mov     rax, qword ptr fs:40    # get canary
        mov     qword ptr canary[rbp], rax

        lea     rcx, reverseArray[rbp]  # pointer
        mov     byte ptr [rcx], NUL     # string terminator
        inc     rcx                     # a char was stored
        
        mov     eax, esi                # int to represent
        mov     r8d, DECIMAL            # base we're in
convertLoop:
        mov     edx, 0                  # for remainder
        div     r8d                     # quotient and remainder
        or      dl, ASCII               # convert to char
        mov     byte ptr [rcx], dl      # append to string
        inc     rcx                     # next place for char
        cmp     eax, 0                  # all done?
        ja      convertLoop             # no, continue
reverseLoop:        
        dec     rcx                     # yes, reverse string
        mov     dl, byte ptr [rcx]      # one char at a time
        mov     byte ptr [rdi], dl
        inc     rdi                     # pointer to dest. string
        cmp     dl, NUL                 # was it NUL?
        jne     reverseLoop             # no, continue
        
        mov     eax, 0                  # return 0;
        mov     rcx, canary[rbp]      # retrieve saved canary
        xor     rcx, fs:40            # and check it
        je      goodCanary
        call    __stack_chk_fail@PLT  # bad canary
goodCanary:
        mov     rsp, rbp                # restore stack pointer
        pop     rbp                     # and caller frame pointer
        ret
