// Simple fraction class

#include "fraction.hpp"
#include <iostream>

fraction::fraction() {
    num = 0;
    den = 1;
}

fraction::~fraction() {
  // Nothing to do for this object
}

void fraction::get() {
    std::cout << "Enter numerator: ";   
    std::cin >> num;
   
    std::cout << "Enter denominator: ";
    std::cin >> den;
}

void fraction::display() {
    std::cout << num << '/' << den << std::endl;
}

void fraction::add(int theValue) {
    num += theValue * den;
}
