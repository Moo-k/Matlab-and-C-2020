#include <stdio.h>
#include <stdlib.h>

int main(void){
    int num, temp;
    int loop = 1;
    int excount = 0;

    printf("How many temperatures to be entered:");
    scanf("%d",&num);

    int* input = malloc(sizeof(int)*num+1);
    int* extreme = malloc(sizeof(int)*num+1);

    for (int i = 0; i < num; i++){
        loop = 1;
        printf("Enter a temperature: ");
        scanf("%d",&temp);
        while (loop == 1){
            if (temp>55||temp<0){
                printf("Invalid temperature ignored\n");
                printf("Enter a temperature: ");
                scanf("%d",&temp);
            }   else{
                input[i] = temp;
                if (temp >= 45){
                    extreme[excount] = temp;
                    excount++;
                }
                loop = 0;
            }
        }
    }

    printf("You entered the temperatures: ");
    for (int j = 0; j < num; j++){
        printf("%d",input[j]);
        if (j != num-1){
            printf(", ");
        }
    }

    printf("\n");

    printf("The extreme heat instances are: ");
    for (int k = 0; k < excount; k++){
        printf("%d",extreme[k]);
        if (k != excount-1){
            printf(", ");
        }
    }
    printf("\n");

    free(input);
    free(extreme);
}
