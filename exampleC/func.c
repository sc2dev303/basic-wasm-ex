#include <stdio.h>

int fact(int n) {
    // printf("running fact\n");
    if(n < 2) {
        return 1;
    }
    return n * fact(n-1);
}