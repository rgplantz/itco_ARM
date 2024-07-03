// A simple Fraction class

#ifndef FRACTION_DFLT_H
#define FRACTION_DFLT_H
class Fraction {
public:
    Fraction() = default;     // Tell compiler to generate default
    ~Fraction() = default;    //   constructor and destructor
    void get();               // Get user's values
    void display();           // Display fraction
    void add_integer(int x);  // Add x to fraction
private:
    int numerator {}; 
    int denominator {1}; 
};
#endif
