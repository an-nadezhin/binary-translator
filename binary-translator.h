//
// Created by andrew on 12.05.18.
//

#ifndef TRANSLATOR_BINARY_TRANSLATOR_H
#define TRANSLATOR_BINARY_TRANSLATOR_H

#include <vector>

typedef std::vector<int> ivec;

class Function {
private:
    ivec vec_;
    int start_;
public:
    Function(int, int, ivec);
    void print_code();
};


#endif //TRANSLATOR_BINARY_TRANSLATOR_H
