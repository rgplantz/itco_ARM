/* helloWorld.c
 * Hello World program using the write() system call
 * one character at a time.
 */
#include <unistd.h>
#define NUL '\x00'

int main(void)
{
  char *stringPtr = "Hello, World!\n";

  while (*stringPtr != NUL) 
  {
    write(STDOUT_FILENO, stringPtr, 1);
    stringPtr++;
  }

  return 0;
}
