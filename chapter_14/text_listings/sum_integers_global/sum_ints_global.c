// Adds two integers using global variables

#include <stdio.h>
#include "add_two_global.h"

// Define global variables.
int x = 123, y = 456, z;

int main(void)
{
  add_two();
  printf("%i + %i = %i\n", x, y, z);

  return 0;
}
