/* coinFlips1.c
 * Flips a coin, heads.
 */

#include <stdio.h>
#include <stdlib.h>

int main()
{
  register int randomNumber;
  register int i;

  for (i = 0; i < 10; i++)
  {
    randomNumber = random();
    if (randomNumber < RAND_MAX/2)
    {
      puts("heads");
    }
  }

  return 0;
}
