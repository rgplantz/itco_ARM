// Fraction class with two constructors

#ifndef FRACTION_H
#define FRACTION_H
class Fraction {
public:
    Fraction() = default;     // tell compiler to generate default
    Fraction(int n, int d) :numerator{n}, denominator{d} {};
    ~Fraction() = default;
    void display();           // displays fraction
    void add_integer(int x);  // adds x to fraction
private:
    int numerator {123};      // weird values so we can see
    int denominator {456};    //    what compiler is doing
};
#endif
