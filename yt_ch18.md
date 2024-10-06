---
layout: default
title: Chapter 18
---

## Chapter 18

1.  Add a second constructor.
    ```cpp
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
    ```
    ```cpp
    // A Fraction class with two constructors

    #include "fraction.h"
    #include <iostream>
    using namespace std;

    Fraction::Fraction()
    {
        numerator = 0;
        denominator = 1;
    }

    Fraction::~Fraction() {}
    // Nothing to do for this object

    void Fraction::get()
    {
        cout << "Enter numerator: ";   
        cin >> numerator;
      
        cout << "Enter denominator: ";
        cin >> denominator;

        if (denominator == 0) {
            cout << "WARNING: Setting 0 denominator to 1\n";
            denominator = 1;
        }
    }

    void Fraction::display()
    {
        cout << numerator << '/' << denominator << '\n';
    }

    void Fraction::add_integer(int x)
    {
        numerator += x * denominator;
    }
    ```
    ```cpp
    // Get 2 fractions from user and add 1.

    #include <iostream>
    #include "fraction.h"
    using namespace std;

    int main(void)
    {
        Fraction my_fraction;
        Fraction your_fraction(12, 34);

        cout << "My fraction:" << '\n';
        my_fraction.display();
        my_fraction.get();
        my_fraction.add_integer(1);
        my_fraction.display();

        cout << "Your fraction:" << '\n';
        your_fraction.display();
        your_fraction.get();
        your_fraction.add_integer(1);
        your_fraction.display();

        return 0;
    }
        ```
2.  16 * index in each array element.
    ```asm
    // Allocate an int array, store (16 * element number)
    ```
