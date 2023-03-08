// Writes a C-style text string to the standard output (screen).
// Calling sequence:
//       x0 <- address of string to be written
// returns number of characters written

#ifndef WRITESTR_H
#define WRITESTR_H
int writeStr(char *);
#endif
