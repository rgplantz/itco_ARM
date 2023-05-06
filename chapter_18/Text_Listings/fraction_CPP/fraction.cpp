// Simple fraction class

#include "fraction.h"
#include <iostream>
using namespace std;

fraction::fraction() {
    num = 0;
    den = 1;
}

fraction::~fraction() {
  // Nothing to do for this object
}

void fraction::get() {
    cout << "Enter numerator: ";   
    cin >> num;
   
    cout << "Enter denominator: ";
    cin >> den;
}

void fraction::display() {
    cout << num << '/' << den << endl;
}

void fraction::add(int theValue) {
    num += theValue * den;
}
