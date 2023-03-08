// Reads a line (through the '\n') from standard input. Has
// a size limit. Extra characters and '\n' are ignored. Stores
// NUL-terminated C string.
// Calling sequence:
//        x0 <- address of place to store string
//        w1 <- string buffer size
// returns number of characters read

#ifndef READLN_H
#define READLN_H
int readLn(char *, int);
#endif
