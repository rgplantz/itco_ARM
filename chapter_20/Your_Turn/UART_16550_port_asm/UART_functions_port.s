# UART_functions.s
# Initialize, read, and write functions for an abstract UART.
# WARNING: This code does not run on any known
#          device. It is meant to sketch some
#          general I/O concepts only.
        .intel_syntax noprefix

        .include "UART_defs"

# Intialize the UART
# Calling sequence:
#   rdi <- base port of UART
        .text
        .globl  UART_init
        .type   UART_init, @function
UART_init:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer

    # no interrupts, don't use FIFO queue
        lea     dx, IER[rdi]  # interrupt enable port
        mov     al, NOINTERRUPT
        out     dx, al
        lea     dx, FCR[rdi]  # FIFO control port
        mov     al, NOFIFO
        out     dx, al
    # set divisor latch access bit = 1 to set baud
        lea     dx, LCR[rdi]  # line control port
        mov     al, SETBAUD
        out     dx, al
        lea     dx, DLM[rdi]  # divisor high-order byte
        mov     al, MSB38400
        out     dx, al
        lea     dx, DLL[rdi]  # divisor low-order byte
        mov     al, LSB38400
        out     dx, al
    # divisor latch access bit = 0 for communications mode
        lea     dx, LCR[rdi]  # line control port
        mov     al, SETCOM
        out     dx, al
        
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
        lea     dx, LSR[rdi]  # line status port
        in      al, dx
        and     al, RxRDY   # character ready?
        jne     inWaitLoop  # no, wait
        lea     dx, RBR[rdi]  # yes, receiver buffer
        in      al, dx      #       get character
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret
	
# Output a single character in sil register
# Calling sequence:
#   rdi <- base address of UART
#   sil <- character to output
        .globl	UART_out
        .type	UART_out, @function
UART_out:
        push    rbp         # save frame pointer
        mov     rbp, rsp    # set new frame pointer

outWaitLoop:
        lea     dx, LSR[rdi]  # line status port
        in      al, dx
        and     al, TxRDY   # ready for character?
        jne     inWaitLoop  # no, wait
        lea     dx, THR[rdi]  # yes, transmitter holding
        mov     al, sil     # need character in al
        out     dx, al      #     send character
        mov     rsp, rbp    # restore stack pointer
        pop     rbp         # and caller frame pointer
        ret

