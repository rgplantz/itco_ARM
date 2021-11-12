# decToSInt.s
# Converts string of numerals to signed decimal int

# Calling sequence
#       rsi <- address of place to store the int
#       rdi <- address of string
#       call decToSInt
#       returns 0
        .intel_syntax noprefix

# Stack frame
        .equ    negFlag,-4
        .equ    localSize,-16
# Code
        .text
        .globl  decToSInt
        .type   decToSInt, @function
decToSInt:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer
        add     rsp, localSize      # for local var.

        mov     dword ptr negFlag[rbp], 0   # assume false

        cmp     byte ptr [rdi], '-' # minus sign?
        jne     checkPlus   # no, check for plus sign
        mov     dword ptr negFlag[rbp], 1   # negFlag = true;
        inc     rdi         # skip minus sign
        jmp     doIt        # and do the conversion
checkPlus:
        cmp     byte ptr [rdi], '+' # plus sign?
        jne     doIt        # no, ready for conversion
        inc     rdi         # skip plus sign
doIt:
        call    decToUInt   # arguments are correct
                            # absolute value now stored
        cmp     byte ptr negFlag[rbp], 0    # negative?
        je      done        # no, all done
        neg     dword ptr [rsi]     # change sign
done:
        mov     eax, 0      # return 0;
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

