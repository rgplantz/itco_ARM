// The Fraction class with two constructors

#ifndef FRACTION_2_H
#define FRACTION_2_H
class Fraction {
public:
    Fraction() = default;     // Tell compiler to generate default
    Fraction(int n) : numerator{n} {}; // Allow setting numerator
    ~Fraction() = default;
    void get();               // Get user's values
    void display();           // Display fraction
    void add_integer(int x);  // Add x to fraction
private:
    int numerator {123};      // Weird values so we can see
    int denominator {456};    //    what the compiler is doing
};
#endif
