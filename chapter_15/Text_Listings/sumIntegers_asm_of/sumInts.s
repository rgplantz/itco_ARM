# sumInts.s
# Adds two integers using local variables
# Checks for overflow
        .intel_syntax noprefix
        
# Stack frame
        .equ    x,-24
        .equ    y,-20
        .equ    z,-16
        .equ    overflow,-12
        .equ    canary,-8
        .equ    localSize,-32
# Read only data
        .section  .rodata
askMsg:
        .string "Enter an integer: "
readFormat:
        .string "%i"
resultFormat:
        .string "%i + %i = %i\n"
overMsg:
        .string "    *** Overflow occurred ***\n"
# Code
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp                 # save frame pointer
        mov     rbp, rsp            # set new frame pointer
        add     rsp, localSize      # for local var.
        mov     rax, fs:40          # get stack canary
        mov     canary[rbp], rax    # and save it
        
        mov     dword ptr x[rbp], 0 # x = 0
        mov     dword ptr y[rbp], 0 # y = 0

        lea     rdi, askMsg[rip]    # ask for integer
        mov     eax, 0
        call    printf@plt
        lea     rsi, x[rbp]         # place to store x
        lea     rdi, readFormat[rip]
        mov     eax, 0
        call    __isoc99_scanf@plt
        
        lea     rdi, askMsg[rip]    # ask for integer
        mov     eax, 0
        call    printf@plt
        lea     rsi, y[rbp]         # place to store y
        lea     rdi, readFormat[rip]
        mov     eax, 0
        call    __isoc99_scanf@plt
        
        lea     rdx, z[rbp]         # place to store sum
        mov     esi, x[rbp]         # load x
        mov     edi, y[rbp]         # load y
        call    addTwo
        mov     overflow[rbp], eax  # save overflow
        mov     ecx, z[rbp]         # load z
        mov     edx, y[rbp]         # load y
        mov     esi, x[rbp]         # load x
        lea     rdi, resultFormat[rip]
        mov     eax, 0              # no floating point
        call    printf@plt
        
        cmp     dword ptr overflow[rbp], 0 # overflow?
        je      noOverflow
        lea     rdi, overMsg[rip]   # yes, print message
        mov     eax, 0
        call    printf@plt
noOverflow:
        mov     eax, 0              # return 0

        mov     rcx, canary[rbp]    # retrieve saved canary
        xor     rcx, fs:40          # and check it
        je      goodCanary
        call    __stack_chk_fail@plt  # bad canary
goodCanary:
        mov     rsp, rbp            # restore stack pointer
        pop     rbp                 # and caller frame pointer
        ret
