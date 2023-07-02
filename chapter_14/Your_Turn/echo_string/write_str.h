// Writes a C-style text string to the standard output (screen).
// Calling sequence:
//       x0 <- address of string to be written
// returns number of characters written

#ifndef WRITE_STR_H
#define WRITE_STR_H
int write_str(char *);
#endif
