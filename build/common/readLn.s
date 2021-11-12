# readLn.s
# Reads a line (through the '\n' character from standard input. Deletes
# the '\n' and creates a C-style text string.        
# Calling sequence:
#       rsi <- length of char array
#       rdi <- address of place to store string
#       call    readLn
# returns number of characters read (not including NUL)
        .intel_syntax noprefix

# Useful constant
        .equ    STDIN,0
# Stack frame, showing local variables and arguments
        .equ    maxLength,-24
        .equ    stringAddr,-16
        .equ    count,-4
        .equ    localSize,-32

        .text
        .globl  readLn
        .type   readLn, @function
readLn:
        push    rbp             # save frame pointer
        mov     rbp, rsp        # set new frame pointer
        add     rsp, localSize  # for local var.

        mov     maxLength[rbp], rsi  # save max storage space
        mov     stringAddr[rbp], rdi # save string pointer

        mov     dword ptr count[rbp], 0  # count = 0;
        sub     dword ptr maxLength[rbp], 1  # room for NUL char
        
        mov     edx, 1          # read one character
        mov     rsi, stringAddr[rbp]  # into storage area
        mov     edi, STDIN            # from keyboard
        call    read@plt
readLoop:
        mov     rax, stringAddr[rbp]  # get pointer
        cmp     byte ptr [rax], '\n'  # return key?
        je      endOfString           # yes, mark end of string
        mov     eax, count[rbp]       # current count
        cmp     maxLength[rbp], eax   # is caller's array full?
        jbe     skipStore             # yes, don't store

        inc     qword ptr stringAddr[rbp] # no, next byte
        inc     dword ptr count[rbp]      # count++;
skipStore:      
        mov     edx, 1          # get another character
        mov     rsi, stringAddr[rbp]  # into storage area
        mov     edi, STDIN      # from keyboard
        call    read@plt
        jmp     readLoop        # and look at it
        
endOfString:
        mov     rax, stringAddr[rbp]  # current pointer
        mov     byte ptr [rax], 0     # mark end of string
	
        mov     eax, count[rbp] # return total;
        mov     rsp, rbp        # restore stack pointer
        pop     rbp             # and caller frame pointer
        ret

