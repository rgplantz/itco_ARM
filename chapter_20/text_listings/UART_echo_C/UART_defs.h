// Definitions for a 16550 UART.
// WARNING: This code does not run on any known device. It is
//      meant to sketch some general I/O concepts only.

#ifndef UART_DEFS_H
#define UART_DEFS_H

// register offsets
#define RBR 0x00    // receive buffer register
#define THR 0x00    // transmit holding register
#define IER 0x01    // interrupt enable register
#define FCR 0x02    // FIFO control register
#define LCR 0x03    // line control register
#define LSR 0x05    // line status register
#define DLL 0x00    // divisor latch LSB
#define DLM 0x01    // divisor latch MSB

// status bits
#define RxRDY 0x01  // receiver ready
#define TxRDY 0x20  // transmitter ready

// commands
#define NO_FIFO        0x00   // don't use FIFO
#define NO_INTERRUPT   0x00   // polling mode
#define MSB_38400      0x00   // 2 bytes used to
#define LSB_38400      0x03   // set baud 38400
#define N_BITS         0x03   // 8 bits
#define STOP_BIT       0x00   // 1 stop bit
#define NO_PARITY      0x00
#define SET_COM        N_BITS | STOP_BIT | NO_PARITY
#define SET_BAUD       0x80 | SET_COM
#endif
