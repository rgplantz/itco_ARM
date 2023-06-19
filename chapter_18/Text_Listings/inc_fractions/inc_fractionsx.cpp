// Gets twp fractions from user and increments each by one

#include "fraction.h"

int main(void)
{
    Fraction x;
    x.display();
    x.get();
    x.add_integer(1);
    x.display();

    Fraction y(1);
    y.display();
    y.get();
    y.add_integer(1);
    y.display();

    return 0;
}
