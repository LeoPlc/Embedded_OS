#include <iostream>
using namespace std;

class A {
        int i;
    public: 
        A(int);
        int getI() const {return i;}
};

A::A(int i):i(i){}

int main() {
    A a(10);
    cout  << a.getI()  << endl;
    return 0;
}