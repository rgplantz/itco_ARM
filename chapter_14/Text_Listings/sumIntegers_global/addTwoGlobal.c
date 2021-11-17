/* addTwoGlobal.c
 * Adds two global integers.
 */

#include "addTwoGlobal.h"

/* Declare global variables defined elsewhere. */
extern int x, y, z;

void addTwo(void)
{
   
  z = x + y;
}
