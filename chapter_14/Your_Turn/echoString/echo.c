/* echo.c
 * Prompts user to enter text and echos it.
 */

#include "writeStr.h"
#include "readLn.h"
#define MAX 5

int main(void)
{
  char text[MAX];
  
  writeStr("Enter some text: ");
  readLn(text, MAX);
  writeStr("You entered: ");
  writeStr(text);
  writeStr("\n");
  
  return 0;
}

