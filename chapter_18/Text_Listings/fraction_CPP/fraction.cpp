// Simple fraction class

#include "fraction.hpp"
#include <iostream>
using namespace std;

fraction::fraction() : num{}, den{1} {}

fraction::~fraction() {}
  // Nothing to do for this object

void fraction::get() {
    cout << "Enter numerator: ";   
    cin >> num;
   
    cout << "Enter denominator: ";
    cin >> den;

    if (den == 0) {
        cout << "WARNING: Setting 0 denominator to 1\n";
        den = 1;
    }
}

void fraction::display() {
    cout << num << '/' << den << '\n';
}

void fraction::add(int theValue) {
    num += theValue * den;
}
