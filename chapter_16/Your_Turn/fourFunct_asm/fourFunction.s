# fourFunctions.s
# Gets two integers, adds, subtracts, mutliplies
# and divides them.
        .intel_syntax noprefix

# Stack frame
#   local vars (rbp)
        .equ    xInt,-4
        .equ    yInt,-8
        .equ    rem,-12
        .equ    localSize,-16
# Read only data
        .section  .rodata
prompt:
        .string "Enter an integer: "
sum:
        .string "Sum = "
diff:
        .string "Difference = "
prod:
        .string "Product = "
quot:
        .string "Quotient = "
remain:
        .string " with Remainder = "
newLine:
        .string "\n"
# Code
        .text
        .globl  main
        .type   main, @function
main:
        push    rbp             # save frame pointer
        mov     rbp, rsp        # set new frame pointer
        add     rsp, localSize  # for local var.
        
        lea     rdi, prompt[rip]    # first integer
        call    writeStr
        
        lea     rdi, xInt[rbp]
        call    getInt
        
        lea     rdi, prompt[rip]    # second integer
        call    writeStr
        
        lea     rdi, yInt[rbp]
        call    getInt
        
        lea     rdi, sum[rip]       # prompt user
        call    writeStr        
        mov     edi, xInt[rbp]
        add     edi, yInt[rbp]
        call    putInt        
        lea     rdi, newLine[rip]   # some formatting
        call    writeStr

        lea     rdi, diff[rip]    # prompt user
        call    writeStr        
        mov     edi, xInt[rbp]
        sub     edi, yInt[rbp]
        call    putInt        
        lea     rdi, newLine[rip]   # some formatting
        call    writeStr

        lea     rdi, prod[rip]    # prompt user
        call    writeStr        
        mov     edi, xInt[rbp]
        imul    edi, yInt[rbp]
        call    putInt        
        lea     rdi, newLine[rip]   # some formatting
        call    writeStr

        lea     rdi, quot[rip]    # prompt user
        call    writeStr  
        mov     edx, 0      
        mov     eax, xInt[rbp]
        idiv    dword ptr yInt[rbp]
        mov     rem[rbp], edx
        mov     edi, eax
        call    putInt        

        lea     rdi, remain[rip]    # prompt user
        call    writeStr        
        mov     edi, rem[rbp]
        call    putInt        
        lea     rdi, newLine[rip]   # some formatting
        call    writeStr

        mov     eax, 0
        mov     rsp, rbp        # restore stack pointer
        pop     rbp             # and caller frame pointer
        ret


