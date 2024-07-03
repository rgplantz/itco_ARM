// Definitions for a 16550 UART.
// WARNING: This code does not run on any known device. It is
//      meant to sketch some general I/O concepts only.

#ifndef UART_DEFS_H
#define UART_DEFS_H

// Register offsets
#define RHR 0x00    // Receive holding register
#define THR 0x00    // Transmit holding register
#define IER 0x01    // Interrupt enable register
#define FCR 0x02    // FIFO control register
#define LCR 0x03    // Line control register
#define LSR 0x05    // Line status register
#define DLL 0x00    // Divisor latch LSB
#define DLM 0x01    // Divisor latch MSB

// Status bits
#define RxRDY 0x01  // Receiver ready
#define TxRDY 0x20  // Transmitter ready

// Commands
#define NO_FIFO       0x00  // Don't use FIFO
#define NO_INTERRUPT  0x00  // Polling mode
#define MSB_38400     0x00  // 2 bytes used to
#define LSB_38400     0x03  //   set baud 38400
#define N_BITS        0x03  // 8 bits
#define STOP_BIT      0x00  // 1 stop bit
#define NO_PARITY     0x00
#define SET_COM       NBITS | STOPBIT | NOPARITY
#define SET_BAUD      0x80 | SETCOM
#endif
