// Get a fraction from user and add 1.

#include "fraction.h"

int main(void)
{
    Fraction my_fraction;

    my_fraction.display();
    my_fraction.get();
    my_fraction.add_integer(1);
    my_fraction.display();

    return 0;
}
