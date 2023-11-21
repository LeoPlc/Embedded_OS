#include <iostream>
using namespace std;

class A {
    int i;
public:
    A(int );
};

A::A(int arg):i(arg) {}
/* The above constructor can also be written as  
A::A(int i) {  
    this->i = i;
}
*/

// Class B contains object of A
class B {
    A a;   // Here a is of type A
public:
    B(int );
};

B::B(int x):a(x) {  //Initializer list must be used for a
    cout << "B's Constructor called";
}

int main() {
    B obj(10);
    return 0;
}
/* OUTPUT:
    A's Constructor called: Value of i: 10
    B's Constructor called
*/
