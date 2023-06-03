// Simple fraction class

#include "fraction.h"
#include <iostream>
using namespace std;

fraction::fraction() {
    numerator = 0;
    denominator = 1;
}

fraction::~fraction() {}
// Nothing to do for this object

void fraction::get() {
    cout << "Enter numerator: ";   
    cin >> numerator;
   
    cout << "Enter denominator: ";
    cin >> denominator;

    if (denominator == 0) {
        cout << "WARNING: Setting 0 denominator to 1\n";
        denominator = 1;
    }
}

void fraction::display() {
    cout << numerator << '/' << denominator << '\n';
}

void fraction::add(int integer) {
    numerator += integer * denominator;
}
