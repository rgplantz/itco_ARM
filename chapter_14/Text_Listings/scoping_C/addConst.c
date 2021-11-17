/* addConst.h
 * Adds constant to automatic, static, global variables.
 */

#include <stdio.h>
#include "addConst.h"
#define INITx 78
#define INITy 90
#define ADDITION 1000

void addConst(void)
{
  int x = INITx;         /* every call */
  static int y = INITy;  /* first call only */
  extern int z;         /* global */
   
  x += ADDITION;  /* add to each */
  y += ADDITION;
  z += ADDITION;

  printf("In addConst:%8i %8i %8i\n", x, y, z);
}
