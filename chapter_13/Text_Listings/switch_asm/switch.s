# switch.s
# Three-way switch using jump table
        .intel_syntax noprefix
# Useful constants
        .equ    LIMIT, 10
# Constant data
        .section  .rodata
oneMsg:
        .string "i = 1"
twoMsg:
        .string "i = 2"
threeMsg:
        .string "i = 3"
overMsg:
        .string "i > 3"
# Jump table
        .align  8
jumpTable:
        .quad   one         # addresses where messages are
        .quad   two         #   printed
        .quad   three
        .quad   over
        .quad   over
        .quad   over
        .quad   over
        .quad   over
        .quad   over        # need an entry for
        .quad   over        #    each possibility
# Program code
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        push    rbx
        push    r12         # save, use for i

        mov     r12, 1      # i = 1;
for:
        cmp     r12, LIMIT  # at limit?
        jge     done        # yes, all done
# List of cases
        lea     rax, jumpTable[rip]
        mov     rbx, r12    # current location in loop
        sub     rbx, 1      # count from 0
        shl     rbx, 3      # multiply by 8
        add     rax, rbx    # location in jumpTable
        mov     rax, [rax]  # get address from jumpTable
        jmp     rax         # jump there
one:
        lea     rdi, oneMsg[rip]
        call    puts@plt    # display message
        jmp     endSwitch
two:
        lea     rdi, twoMsg[rip]
        call    puts@PLT
        jmp     endSwitch
three:
        lea     rdi, threeMsg[rip]
        call    puts@plt
        jmp     endSwitch
over:
        lea     rdi, overMsg[rip]
        call    puts@plt
endSwitch:
        inc     r12         # i++;
        jmp     for         # loop back
done:
        mov     eax, 0      # return 0;
        pop     r12         # restore regs
        pop     rbx
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret
