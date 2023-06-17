// fraction class with two constructors

#ifndef FRACTION_H
#define FRACTION_H
class Fraction {
public:
    Fraction() = default;             // tell compiler to generate default
    Fraction(int n) :numerator{n} {}; // allow setting numerator
    ~Fraction() = default;
    void get();                       // gets user's values
    void display();                   // displays fraction
    void add_integer(int x);          // adds x to fraction
private:
    int numerator {}; 
    int denominator {1}; 
};
#endif
