// simple fraction class

#ifndef FRACTIONNC_H
#define FRACTIONNC_H
class fraction {
        int num {0};              // specify defaults
        int den {1};
    public:
        fraction() = default;     // use default values
        ~fraction() = default;
        void get();               // gets user's values
        void display();           // displays fraction
        void add(int theValue);   // adds theValue
};
#endif
