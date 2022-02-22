/* writeStr.h
 * C header file for writeStr assembly language function
 * Writes a C-style text string to the standard output (screen).
 * Calling sequence:
 *       rdi <- address of string to be written
 *       call    writestr
 * returns number of characters written
 */
#ifndef WRITESTR_H
#define WRITESTR_H
int writeStr(char *);
#endif
