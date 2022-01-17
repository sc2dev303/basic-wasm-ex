#include <func.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if(argc < 2) {
        printf("need at least one argument\n");
        return -1;
    }

    printf("fact(%s)=%i\n", argv[1], fact(atoi(argv[1])));
}