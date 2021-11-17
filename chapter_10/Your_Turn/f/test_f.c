/* test_f.c
 * Tests f() function.
 */

#include <stdio.h>
#include "f.h"

int main(void)
{
  int returnValue;
  returnValue = f();
  printf("f returned %i.\n", returnValue);

  return 0;
}

