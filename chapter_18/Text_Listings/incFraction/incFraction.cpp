// Gets a fraction from user and increments by one

#include "fraction.h"

int main(void) {
    Fraction x;

    x.display();
    x.get();
    x.add(1);
    x.display();
    return 0;
}