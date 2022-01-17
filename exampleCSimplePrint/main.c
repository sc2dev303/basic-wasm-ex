#include <func.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    // printf("arg value is: %s\n", argv[1]);
    // printf("arg value is: %s\n", argv[2]);
    printf("arg value is: %s\n", argv[1]);
    if(argc < 2) {
        printf("need at least one argument\n");
        return -1;
    }
    
    printf("%i\n", fact(atoi(argv[1])));
    return 0;
}