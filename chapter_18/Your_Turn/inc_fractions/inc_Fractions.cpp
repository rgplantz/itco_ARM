// Gets twp fractions from user and increments each by one

#include "fraction.h"

int main(void)
{
    fraction x;
    x.display();
    x.get();
    x.add(1);
    x.display();

    fraction y(1);
    y.display();
    y.get();
    y.add(1);
    y.display();

    return 0;
}
