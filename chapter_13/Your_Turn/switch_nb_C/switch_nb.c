/* switch_nb.c
 * Three-way selection.
 */

#include <stdio.h>

int main(void)
{
  register int selector;
  register int i;

  for (i = 1; i <= 5; i++)
  {
    selector = i;
    switch (selector)
    {
      case 1:
        puts("i = 1");
      case 2:
        puts("i = 2");
      case 3:
        puts("i = 3");
      default:
        puts("i > 3");
    }
  }

  return 0;
}
