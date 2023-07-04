// Fraction class with two constructors

#include <iostream>
#include "fraction.h"
using namespace std;

void Fraction::display()
{
    cout << numerator << '/' << denominator << '\n';
}

void Fraction::add_integer(int x)
{
    numerator += x * denominator;
}
