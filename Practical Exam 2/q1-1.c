#include <stdio.h>

int main(void){
    int input[6];
    float total = 0;
    float ave = 0;

    for (int i = 0; i < 5; i++){
        printf("Enter a number: ");
        scanf("%d",&input[i]);
        total += input[i];
    }

    input[5] = '\0';

    ave = total/5;

    printf("The average of your numbers is: %.1f\n",ave);
}
