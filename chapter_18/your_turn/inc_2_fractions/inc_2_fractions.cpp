// Get 2 fractions from user and add 1.

#include "fraction.h"
using namespace std;

int main(void)
{
    Fraction my_fraction;
    Fraction your_fraction;

    cout << "My fraction:" << '\n';
    my_fraction.display();
    my_fraction.get();
    my_fraction.add_integer(1);
    my_fraction.display();

    cout << "Your fraction:" << '\n';
    your_fraction.display();
    your_fraction.get();
    your_fraction.add_integer(1);
    your_fraction.display();

    return 0;
}
