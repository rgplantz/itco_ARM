// Simple fraction class

#include "fractionNC.hpp"
#include <iostream>

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
