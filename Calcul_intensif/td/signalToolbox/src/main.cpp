#include "signal_utils.h"
#include <cmath>
#include <iostream>
#include <vector>

using namespace std;

template<typename T>
std::ostream& operator<<(std::ostream& os, const std::vector<T>& vec) {
    os << "[";
    for (size_t i = 0; i < vec.size(); ++i) {
        os << vec[i];
        if (i < vec.size() - 1) {
            os << ", ";
        }
    }
    os << "]";
    return os;
}

int main() {
    std::vector<double> vecteurDouble = {-0.236468, -0.192966, -0.193747, 0.12682};
    std::vector<int> vecteurInt = {1, 2, 3, 4, 5};

    std::cout << vecteurDouble << std::endl;
    std::cout << vecteurInt << std::endl;

    return 0;
}
