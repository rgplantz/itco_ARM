# UART_functions.s
# Initialize, read, and write functions for a 16550 UART.
# WARNING: This code does not run on any known
#          device. It is meant to sketch some
#          general I/O concepts only.
        .intel_syntax noprefix

        .include "UART_defs"

# Intialize the UART
# Calling sequence:
#   rdi <- base address of UART
        .text
        .globl  UART_init
        .type   UART_init, @function
UART_init:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer

    # no interrupts, don't use FIFO queue
        mov     byte ptr IER[rdi], NOINTERRUPT
        mov     byte ptr FCR[rdi], NOFIFO
    # set divisor latch access bit = 1 to set baud
        mov     byte ptr LCR[rdi], SETBAUD
        mov     byte ptr DLM[rdi], MSB38400
        mov     byte ptr DLL[rdi], LSB38400
    # divisor latch access bit = 0 for communications mode
        mov     byte ptr LCR[rdi], SETCOM
        
        mov     rsp, rbp    # yes, restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

# Input a single character
# Calling sequence:
#   rdi <- base address of UART
#   returns character in al register
        .globl  UART_in
        .type   UART_in, @function
UART_in:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer

inWaitLoop:
        and     byte ptr LSR[rdi], RxRDY  # character available?
        jne     inWaitLoop                # no, wait
        movzx   eax, byte ptr RBR[rdi]    # yes, get it
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret
	
# Output a single character in sil register
        .globl	UART_out
        .type	UART_out, @function
UART_out:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer

outWaitLoop:
        and     byte ptr LSR[rdi], TxRDY  # ready for character?
        jne     outWaitLoop               # no, wait
        mov     THR[rdi], sil             # yes, send it
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

