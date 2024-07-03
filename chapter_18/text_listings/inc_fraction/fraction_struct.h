// A simple Fraction class

#ifndef FRACTION_H
#define FRACTION_H
struct Fraction {
public:
    Fraction();               // Default constructor
    ~Fraction();              // Destructor
    void get();               // Get user's values
    void display();           // Display fraction
    void add_integer(int x);  // Add x to fraction
private:
    int numerator; 
    int denominator; 
};
#endif
