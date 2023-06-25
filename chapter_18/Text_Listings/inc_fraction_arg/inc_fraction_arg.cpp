// Increments fraction by one

#include "fraction_arg.h"

int main(void)
{
    Fraction x(1);
    x.display();
    x.get();
    x.add_integer(1);
    x.display();

    return 0;
}
