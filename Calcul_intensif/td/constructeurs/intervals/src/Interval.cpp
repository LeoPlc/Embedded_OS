#include "Interval.h"
#include <cmath>
#include <iostream>

Interval::Interval() : inf(NAN), sup(NAN) {
    std::cout << "Default Constructor" << std::endl;
};

Interval::Interval(double inf, double sup) : inf(inf), sup(sup) {
    std::cout << "2 Parameters Constructor" << std::endl;
};

Interval::Interval(double d) : inf(d), sup(d) {
    std::cout << "1 Parameter Constructor" << std::endl;
};

Interval::~Interval() {
    std::cout << "Interval Destructor" << std::endl;
};


double Interval::getInf() const {
    return inf;
}

double Interval::getSup() const {
    return sup;
}

int main(){
    int x = 3;
    int y =5;
    
    Interval(x,y);
    return 0;
}