# displaySMoney.s
# Displays money in dollars and cents, signed.
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
zero:
        .string "0"
msg:
        .string "Total = $"
msgNeg:
        .string "Total = -$"
endl:
        .string "\n"
# Code
        .text
        .globl  displaySMoney
        .type   displaySMoney, @function
displaySMoney:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.
        
        mov     money[rbp], edi # save input money
        cmp     dword ptr money[rbp], 0 # negative?
        jge     positive        # no
        lea     rdi, msgNeg[rip]      # yes, print minus sign
        call    writeStr
        neg     dword ptr money[rbp]  # work with positive
        jmp     showNumbers
positive:
        lea     rdi, msg[rip]   # nice message
        call    writeStr
showNumbers:        
        mov     edx, 0      # clear high order
        mov     eax, money[rbp]   # convert money amount
        mov     ecx, cent2dollars #     to dollars and cents
        div     ecx
        mov     money[rbp], edx # save cents

        mov     edi, eax    # dollars
        call    putUInt     # write to screen

        lea     rdi, decimal[rip] # decimal point
        call    writeStr
        
        cmp     dword ptr money[rbp], 10  # 2 decimal places?
        jae     twoDecimal      # yes
        lea     rdi, zero[rip]  # no, 0 in tenths place
        call    writeStr
twoDecimal:
        mov     edi, money[rbp]    # load cents
        call    putUInt     # write to screen

        lea     rdi, endl[rip]
        call    writeStr

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

