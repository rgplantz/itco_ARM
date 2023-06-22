// Fraction class with two constructors

#ifndef FRACTION_2_H
#define FRACTION_2_H
class Fraction {
public:
    Fraction() = default;     // tell compiler to generate default
    Fraction(int n);          // allow setting numerator
    ~Fraction() = default;
    void get();               // gets user's values
    void display();           // displays fraction
    void add_integer(int x);  // adds x to fraction
private:
    int numerator {}; 
    int denominator {1}; 
};
#endif
