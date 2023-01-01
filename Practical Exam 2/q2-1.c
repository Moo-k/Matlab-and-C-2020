#include <stdio.h>

int count_values_between_2_5(int* values, int size){
    int count = 0;
    for (int i = 0; i < size; i++){
        if (values[i]>=2 && values[i]<=5){
            count++;
        }
    }

    return count;
}

int main(void) {

    int values[6]={1,2,4,5,3,6};
    int size=6;

    printf("There are %d values between 2 and 5 (inclusive)\n", count_values_between_2_5(values, size));
}
