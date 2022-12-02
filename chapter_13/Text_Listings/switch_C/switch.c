// switch.c
// Three-way selection.

#include <stdio.h>

int main(void)
{
  int i;

  for (i = 1; i <= 10; i++)
  {
    switch (i)
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
