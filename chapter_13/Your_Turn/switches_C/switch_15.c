/* switch_15.c
 * Three-way selection.
 */

#include <stdio.h>

int main(void)
{
  register int selector;
  register int i;

  for (i = 1; i <= 15; i++)
  {
    selector = i;
    switch (selector)
    {
      case 1:
        puts("i = 1");
        break;
      case 2:
        puts("i = 2");
        break;
      case 3:
        puts("i = 3");
        break;
      default:
        puts("i > 3");
    }
  }

  return 0;
}
