// Gets two fractions from user, adds 1 to one and 10 to other

#include "fractionNC.hpp"

int main(void) {
    fraction x;
    x.display();
    x.get();
    x.add(1);
    x.display();

    fraction y;
    y.display();
    y.get();
    y.add(10);
    y.display();
    return 0;
}
