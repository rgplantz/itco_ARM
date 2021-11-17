# displayMoney.s
# Displays money in dollars and cents.
# Calling sequence:
#   edi <- money in cents
        .intel_syntax noprefix
# Useful constant
        .equ    cent2dollars, 100
# Stack frame
        .equ    money,-16
        .equ    localSize,-16
# Constant data
        .section	.rodata
        .align 8
decimal:
        .string "."
msg:
        .string "Total = $"
endl:
        .string "\n"
# Code
        .text
        .globl  displayMoney
        .type   displayMoney, @function
displayMoney:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.
        
        mov     money[rbp], rdi # save input money
        lea     rdi, msg[rip]   # nice message
        call    writeStr
        
        mov     edx, 0      # clear high order
        mov     eax, money[rbp]   # convert money amount
        mov     ebx, cent2dollars #     to dollars and cents
        div     ebx
        mov     money[rbp], edx # save cents
        mov     edi, eax    # dollars
        call    putUInt     # write to screen
        lea     rdi, decimal[rip]
        call    writeStr
        
        mov     edi, money[rbp]    # load cents
        call    putUInt     # write to screen

        lea     rdi, endl[rip]
        call    writeStr

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

