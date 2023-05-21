// Simple fraction class

#include "fraction.hpp"
// Use char arrays because writeStr is C function.
char numMsg[] = "Enter numerator: ";
char denMsg[] = "Enter denominator: ";

fraction::fraction() : num{}, den{1} {}

fraction::~fraction() {}
  // Nothing to do for this object

void fraction::get() {
    writeStr(numMsg);   
    num = getInt();
   
    writeStr(denMsg);
    den = getInt();
}

void fraction::display() {
    putInt(num);
    writeChar('/');
    putInt(den);
    writeChar('\n');
}

void fraction::add(int theValue) {
    num += theValue * den;
}
