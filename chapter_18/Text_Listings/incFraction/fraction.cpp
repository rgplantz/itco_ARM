// Simple fraction class

#include "fraction.h"
#include <iostream>
using namespace std;

Fraction::Fraction() {
    numerator = 0;
    denominator = 1;
}

Fraction::~Fraction() {}
// Nothing to do for this object

void Fraction::get() {
    cout << "Enter numerator: ";   
    cin >> numerator;
   
    cout << "Enter denominator: ";
    cin >> denominator;

    if (denominator == 0) {
        cout << "WARNING: Setting 0 denominator to 1\n";
        denominator = 1;
    }
}

void Fraction::display() {
    cout << numerator << '/' << denominator << '\n';
}

void Fraction::add(int integer) {
    numerator += integer * denominator;
}
