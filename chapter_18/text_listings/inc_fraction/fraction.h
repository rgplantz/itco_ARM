// A simple Fraction class

#ifndef FRACTION_H
#define FRACTION_H
class Fraction {
public:
    Fraction();               // Default constructor
    ~Fraction();              // Destructor
    void get();               // Get user's values
    void display();           // Display fraction
    void add_integer(int x);  // Adds x to fraction
private:
    int numerator; 
    int denominator; 
};
#endif
