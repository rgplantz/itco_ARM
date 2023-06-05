// Simple fraction class

#include "fractionDef.h"
#include <iostream>
using namespace std;

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

void Fraction::add_integer(int x) {
    numerator += x * denominator;
}
