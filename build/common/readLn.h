/* readLn.h
 * C header file for readLn assembly language function
 * Reads a line (through the '\n' character from standard input. Deletes
 * the '\n' and creates a C-style text string.        
 * Calling sequence:
 *       rsi <- length of char array
 *       rdi <- address of place to store string
 *       call    readLn
 * returns number of characters read (not including NUL)
 */

#ifndef READLN_H
#define READLN_H

int readLn(char *, int);

#endif

