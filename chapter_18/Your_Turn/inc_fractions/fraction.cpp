// fraction class with two constructors

#include "fraction.h"
using namespace std;

fraction::fraction(int top) : numerator {top} {}

fraction::~fraction() {}
  // Nothing to do for this object

void fraction::get()
{
    cout << "Enter numerator: ";   
    cin >> num;
   
    cout << "Enter denominator: ";
    cin >> den;

    if (den == 0) {
        cout << "WARNING: Setting 0 denominator to 1\n";
        den = 1;
    }
}

void fraction::display()
{
    cout << num << '/' << den << '\n';
}

void fraction::add_int(int x)
{
    num += x * den;
}
