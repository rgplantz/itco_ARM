// fraction.cpp
// Simple fraction class

#include "fraction.hpp"
// Use char arrays because writeStr is C function.
char numMsg[] = "Enter numerator: ";
char denMsg[] = "Enter denominator: ";
char over[] = "/";
char endl[] = "\n";

void fraction::get()
{
  writeStr(numMsg);   
  getInt(&num);
   
  writeStr(denMsg);
  getInt(&den);
}

void fraction::display()
{
  putInt(num);
  writeStr(over);
  putInt(den);
  writeStr(endl);
}

void fraction::add(int theValue)
{
  num += theValue * den;
}
