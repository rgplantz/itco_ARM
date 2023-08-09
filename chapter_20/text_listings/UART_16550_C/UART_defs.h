// Definitions for a 16550 UART.
// WARNING: This is a very limited set of definitions
//          for the device. It is meant to sketch some
//          general I/O concepts only.

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
#define NOFIFO        0x00    // don't use FIFO
#define NOINTERRUPT   0x00    // polling mode
#define MSB38400      0x00    // 2 bytes used to
#define LSB38400      0x03    // set baud 38400
#define NBITS         0x03    // 8 bits
#define STOPBIT       0x00    // 1 stop bit
#define NOPARITY      0x00
#define SETCOM        NBITS | STOPBIT | NOPARITY
#define SETBAUD       0x80 | SETCOM
#endif

