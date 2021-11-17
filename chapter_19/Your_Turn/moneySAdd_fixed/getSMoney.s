# getSMoney.s
# Gets money in dollars and cents.
# Outputs 32-bit value, money in cents.
# Calling sequence:
#   rdi <- pointer to length
        .intel_syntax noprefix
# Useful constant
        .equ    dollar2cents, 100
# Stack frame
        .equ    moneyPtr,-16
        .equ    dollars,-8
        .equ    cents,-4
        .equ    localSize,-16
# Constant data
        .section	.rodata
        .align 8
prompt:
        .string "Enter amount\n"
dollarsPrompt:
        .string "    Dollars: "
centsPrompt:
        .string "      Cents: "
# Code
        .text
        .globl  getSMoney
        .type   getSMoney, @function
getSMoney:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize  # for local var.
        
        mov     moneyPtr[rbp], rdi  # save pointer to output

        lea     rdi, prompt[rip]    # prompt user
        call    writeStr

        lea     rdi, dollarsPrompt[rip] # ask for dollars
        call    writeStr
        lea     rdi, dollars[rbp]   # get dollars
        call    getInt
        lea     rdi, centsPrompt[rip] # ask for cents
        call    writeStr
        lea     rdi, cents[rbp]     # get cents
        call    getInt
        
        mov     eax, dword ptr dollars[rbp] # retrieve dollars
        mov     ecx, dollar2cents   # scale dollars
        mul     ecx                 #          to cents
        mov     ecx, dword ptr cents[rbp]   # retrieve cents
        add     eax, ecx            # add in cents
        mov     rcx, moneyPtr[rbp]  # load pointer to output
        mov     [rcx], eax  # output

        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

