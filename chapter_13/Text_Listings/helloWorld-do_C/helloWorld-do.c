/* helloWorld-do.c
 * Hello World program using the write system call
 * one character at a time.
 */
#include <unistd.h>
#define NUL '\x00'

int main(void)
{
  char *stringPtr = "Hello, World!\n";

  do
  {
    write(STDOUT_FILENO, stringPtr, 1);
    stringPtr++;
  } while (*stringPtr != NUL);

  return 0;
}
