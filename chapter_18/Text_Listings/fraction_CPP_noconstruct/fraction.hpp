// fraction.hpp
// simple fraction class

#ifndef FRACTION_HPP
#define FRACTION_HPP
// Uses the following C functions
extern "C" int writeStr(char *);
extern "C" int getInt(int *);
extern "C" int putInt(int);

class fraction
{
    int num{0};               // numerator
    int den{1};               // denominator
  public:
    void get();               // gets user's values
    void display();           // displays fraction
    void add(int theValue);   // adds integer
};
#endif
