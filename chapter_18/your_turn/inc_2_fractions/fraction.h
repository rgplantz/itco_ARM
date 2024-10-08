// A Fraction class with two constructors

#ifndef FRACTION_H
#define FRACTION_H
class Fraction {
public:
    Fraction();               // Default constructor
    Fraction(int n, int d) : numerator{n}, denominator{d} {}; // Allow setting numerator and denominator
    ~Fraction();              // Destructor
    void get();               // Get user's values
    void display();           // Display fraction
    void add_integer(int x);  // Adds x to fraction
private:
    int numerator; 
    int denominator; 
};
#endif
