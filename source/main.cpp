#include <stdlib.h>
#include <stdio.h>

void print(const char *my_name);

int main(int argc, char *argv[]){
    printf("Hello World\n");
    print("Gabriel");
    return 0;
}

void print(const char *my_name){
    const char *name = my_name;
    char letter = (char)*(name + 2);
    printf("Meu Nome e %s Terceira Letra:%c\n", name, letter);
}