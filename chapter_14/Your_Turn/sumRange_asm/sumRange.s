# sumRange.s
# Sums the integers 1 - 9.
        .intel_syntax noprefix
        
# Stack frame
#   local vars (rbp)
        .equ    nLow,-4
        .equ    nHigh,-8
        .equ    total,-12
        .equ    localSize,-16
# Read only data
        .section  .rodata
readFormat:
        .string "%i"
lowerFormat:
        .string "Enter lower number: "
higherFormat:
        .string "Enter higher number: "
result:
        .string "Sum of all integers between them = %i\n"
# Code
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp             # save frame pointer
        mov     rbp, rsp        # set new frame pointer
        add     rsp, localSize  # for local var.

        lea     rdi, lowerFormat[rip]   # ask for lower number
        mov     eax, 0
        call    printf@plt
        lea     rsi, nLow[rbp]  # get lower number
        lea     rdi, readFormat[rip]
        mov     eax, 0
        call    __isoc99_scanf@plt
        
        lea     rdi, higherFormat[rip]  # ask for higher number
        mov     eax, 0
        call    printf@plt
        lea     rsi, nHigh[rbp] # get higher number
        lea     rdi, readFormat[rip]
        mov     eax, 0
        call    __isoc99_scanf@plt
        
        mov     esi, nHigh[rbp] # nHigh
        mov     edi, nLow[rbp]  # nLow
        call    addRange
        mov     total[rbp], eax # total = sumNine(...)
	
        mov     esi, total[rbp] # show result
        lea     rdi, result[rip]
        mov     eax, 0
        call    printf@plt

        mov     eax, 0          # return 0;
        mov     rsp, rbp        # restore stack pointer
        pop     rbp             # and caller frame pointer
        ret


