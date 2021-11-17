# coinFlips2.s
# flips a coin, heads/tails
        .intel_syntax noprefix

# Useful constants
        .equ    MIDDLE, 1073741823  # half of RAND_MAX
        .equ    STACK_ALIGN, 8

# Constant data
        .section .rodata
headsMsg:
        .string "heads"
tailsMsg:
        .string "tails"

# The code
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp                 # save frame pointer
        mov     rbp, rsp            # set new frame pointer
        push    r12                 # save, use for i
        sub     rsp, STACK_ALIGN
        
        mov     r12, 0              # i = 0;
for:
        cmp     r12, 10             # any more?
        jae     done                # no, all done
        
        call    random@plt          # get a random number
        cmp     eax, MIDDLE         # which half?
        jg      tails
        lea     rdi, headsMsg[rip]  # it was heads
        call    puts@plt
        jmp     next                # jump over else block
tails:
        lea     rdi, tailsMsg[rip]  # it was tails
        call    puts@plt
next:   inc     r12                 # i++;
        jmp     for
done:
        add     rsp, STACK_ALIGN    # realign stack ptr
        pop     r12                 # restore for caller
        mov     rsp, rbp            # restore stack pointer
        pop     rbp                 # and caller frame pointer
	 ret
