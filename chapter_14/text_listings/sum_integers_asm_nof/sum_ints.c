// Add two integers using local variables

#include <stdio.h>
#include "add_two.h"

int main(void)
{
    int x = 0, y = 0, z;
    
    printf("Enter an integer: ");
    scanf("%i", &x);
    printf("Enter an integer: ");
    scanf("%i", &y);
    add_two(&z, x, y);
    printf("%i + %i = %i\n", x, y, z);

    return 0;
}
