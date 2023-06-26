// Fraction class with two constructors

#ifndef FRACTION_2_H
#define FRACTION_2_H
class Fraction {
public:
    Fraction() = default;     // tell compiler to generate default
    Fraction(int n) :numerator{n} {}; // allow setting numerator
    ~Fraction() = default;
    void get();               // gets user's values
    void display();           // displays fraction
    void add_integer(int x);  // adds x to fraction
private:
    int numerator {123};      // weird values so we can see
    int denominator {456};    //    what compiler is doing
};
#endif
