// Adds two global integers.

#include "add_two_global.h"

// Declare global variables defined elsewhere.
extern int x, y, z;

void add_two(void)
{
   
  z = x + y;
}
