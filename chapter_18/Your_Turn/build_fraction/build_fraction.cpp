// Gets two fractions from user and increments each by one

#include <iostream>
#include "fraction.h"
using namespace std;

int main(void)
{
    int numerator, denominator;

    cout << "Enter a numerator: ";
    cin >> numerator;
    cout << "Enter a denominator: ";
    cin >> denominator;

    Fraction x(numerator, denominator);
    x.display();
    x.add_integer(1);
    x.display();

    return 0;
}
