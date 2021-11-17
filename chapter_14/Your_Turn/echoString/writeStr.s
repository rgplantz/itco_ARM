# writeStr.s
# Writes a C-style text string to the standard output (screen).
# Calling sequence:
#       rdi <- address of string to be written
#       call    writestr
# returns number of characters written
        .intel_syntax noprefix

# Useful constants
        .equ    STDOUT,1
        .equ    NUL,0
# Stack frame, showing local variables and arguments
        .equ    stringAddr,-16
        .equ    count,-4
        .equ    localSize,-16

        .text
        .globl  writeStr
        .type   writeStr, @function
writeStr:
        push    rbp             # save frame pointer
        mov     rbp, rsp        # set new frame pointer
        add     rsp, localSize  # for local var.

        mov     stringAddr[rbp], rdi    # save string pointer
        mov     dword ptr count[rbp], 0 # count = 0;
writeLoop:
        mov     rax, stringAddr[rbp]    # get current pointer
        cmp     byte ptr [rax], NUL     # at end yet?
        je     done             # yes, all done
 
        mov     edx, 1          # no, write one character
        mov     rsi, rax        # points to current char
        mov     edi, STDOUT     # on the screen
        call    write@plt
        inc     dword ptr count[rbp]    # count++;
        inc     qword ptr stringAddr[rbp] # stringAddr++;
        jmp     writeLoop       # and check for end
done:
        mov     eax, count[rbp] # return total;
        mov     rsp, rbp        # restore stack pointer
        pop     rbp             # and caller frame pointer
        ret
