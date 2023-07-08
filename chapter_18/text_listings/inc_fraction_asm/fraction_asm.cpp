// Simple fraction class

#include "fraction_dflt.h"
// Uses the following C functions
extern "C" {
    #include "write_str.h"
    #include "write_char.h"
    #include "get_int.h"
    #include "put_int.h"
}
// Use char arrays because write_str is C function.
char num_msg[] = "Enter numerator: ";
char den_msg[] = "Enter denominator: ";

void Fraction::get()
{
    write_str(num_msg);   
    numerator = get_int();
   
    write_str(den_msg);
    denominator = get_int();
}

void Fraction::display()
{
    put_int(numerator);
    write_char('/');
    put_int(denominator);
    write_char('\n');
}

void Fraction::add_integer(int x)
{
    numerator += x * denominator;
}
