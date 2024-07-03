// Get two fractions from user and increments each by 1.

#include "fraction_2.h"

int main(void)
{
    Fraction x;
    x.display();
    x.get();
    x.add_integer(1);
    x.display();

    Fraction y(78);
    y.display();
    y.get();
    y.add_integer(1);
    y.display();

    return 0;
}
