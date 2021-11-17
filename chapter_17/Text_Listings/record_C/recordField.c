/* recordField.c
 * Allocates a record and assigns a value to each field.
 */

#include <stdio.h>

int main(void)
{
  struct
  {
    char aChar;
    int anInt;
    char anotherChar;
  } x;

  x.aChar = 'a';
  x.anInt = 123;
  x.anotherChar = 'b';

  printf("x: %c, %i, %c\n",
          x.aChar, x.anInt, x.anotherChar);
  return 0;
}


