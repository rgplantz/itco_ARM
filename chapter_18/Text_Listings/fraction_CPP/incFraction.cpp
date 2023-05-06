// incFraction.cpp
// Gets a fraction from user and increments by one

#include "fraction.hpp"

int main(void) {
    fraction x;

    x.display();
    x.get();
    x.add(1);
    x.display();
    return 0;
}
