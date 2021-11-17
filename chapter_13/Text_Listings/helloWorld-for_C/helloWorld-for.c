/* helloWorld-for.c
 * Hello World program using the write() system call
 * one character at a time.
 */
#include <unistd.h>
#define NUL '\x00'

int main(void)
{
  char *stringPtr;

  for (stringPtr = "Hello, World!\n"; *stringPtr != NUL; stringPtr++) 
    write(STDOUT_FILENO, stringPtr, 1);

  return 0;
}
