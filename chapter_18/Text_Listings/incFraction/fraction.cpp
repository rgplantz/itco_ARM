// Simple fraction class

#include "fraction.h"
#include <iostream>
using namespace std;

Fraction::Fraction() {
    num = 0;
    den = 1;
}

Fraction::~Fraction() {}
// Nothing to do for this object

void Fraction::get() {
    cout << "Enter numerator: ";   
    cin >> num;
   
    cout << "Enter denominator: ";
    cin >> den;

    if (den == 0) {
        cout << "WARNING: Setting 0 denominator to 1\n";
        den = 1;
    }
}

void Fraction::display() {
    cout << num << '/' << den << '\n';
}

void Fraction::add(int integer) {
    num += integer * den;
}
