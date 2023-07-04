// Reads a line (through the '\n') from standard input. Does not
// stores '\n' and any characters beyond maximum. Appends NUL at
// end of stored characters. Allow maximum + 1 for character storage.
// Calling sequence:
//        x0 <- address of place to store string
//        w1 <- maximum characters to store
// returns number of characters read

#ifndef READ_STR_H
#define READ_STR_H
int read_str(char *, int);
#endif
