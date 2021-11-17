# arrayFifth.s
# Allocates an int array, stores 2 X element number
# in each element, then stores 123 in fifth element.
        .intel_syntax noprefix
# Stack frame
        .equ    intArray,-48
        .equ    canary,-8
        .equ    localSize,-48
# Constant
        .equ    N,10
# Code
        .text
        .globl	main
        .type	main, @function
main:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.
        mov     rax, qword ptr fs:40    # get canary
        mov     qword ptr canary[rbp], rax

        mov     esi, N      # number of elements
        lea     rdi, intArray[rbp]   # our array
        call    twiceIndex

        mov     rcx, 4      # fifth element
        mov     dword ptr [rdi+rcx*4], 123  # store 123 there

        mov     esi, N      # number of elements
        lea     rdi, intArray[rbp]   # our array
        call    displayArray
        
        mov     eax, 0      # return 0;
        mov     rcx, qword ptr canary[rbp]
        xor     rcx, qword ptr fs:40
        je      allOK
        call    __stack_chk_fail@plt
allOK:
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

