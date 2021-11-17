# echoChar.s
# Prompts user to enter a character, then echoes the response
        .intel_syntax noprefix
# Useful constants
        .equ    STDIN,0
        .equ    STDOUT,1
# Stack frame
        .equ    aLetter,-9
        .equ    canary,-8
        .equ    localSize,-16

# Constant data
        .section  .rodata
prompt:
        .string "Enter one character: "
        .equ    promptSz,.-prompt-1
msg:
        .string "You entered: "
        .equ    msgSz,.-msg-1
        .text
# Code 
        .globl  main
        .type   main, @function
main:
        push    rbp                   # save caller's frame pointer
        mov     rbp, rsp              # our frame pointer
        add     rsp, localSize        # for local var.

        mov     rax, fs:40            # get stack canary
        mov     canary[rbp], rax      # and save it

        mov     edx, promptSz         # prompt size
        lea     rsi, prompt[rip]      # address of prompt text string
        mov     edi, STDOUT           # standard out
        call    write@plt             # invoke write function

        mov     edx, 1                # 1 character
        lea     rsi, aLetter[rbp]     # place to store character
        mov     edi, STDIN            # standard in
        call    read@plt              # invoke read function

        mov     edx, msgSz            # message size
        lea     rsi, msg[rip]         # address of message text string
        mov     edi, STDOUT           # standard out
        call    write@plt             # invoke write function

        mov     edx, 1                # 1 character
        lea     rsi, aLetter[rbp]     # place where character stored
        mov     edi, STDOUT           # standard out
        call    write@plt             # invoke write function

        mov     eax, 0                # return 0

        mov     rcx, canary[rbp]      # retrieve saved canary
        xor     rcx, fs:40            # and check it
        je      goodCanary
        call    __stack_chk_fail@PLT  # bad canary
goodCanary:
        mov     rsp, rbp              # delete local variables
        pop     rbp                   # restore caller's frame pointer
        ret                           # back to calling function
