#include <stdio.h>
#include <stdlib.h>

int checkPrime(int num)
{
    if(num == 0 || num == 1){
        return 0;
    }
    int i;
    for(i = 2; i <= num/2; i++){
        if(num % i == 0){
            return 0;
        }
    }
    return 1;
}

int reverse(int num)
{
    int rev =0, rem;

    while (num != 0){
        rem = num % 10;
        rev = rev * 10 + rem;
        num = num/10;
    }
    return rev;
}
int square(int num)
{
    return num * num;
}

int main(void)
{

    printf( "REVERSIBLE PRIME SQUARES\n");
    int count = 0;
    for(int x = 0; count <= 10; x++)
    {
        if(checkPrime(x))
        {
            int reversed_square;
            int m = square(x);
            reversed_square = reverse(m);
            if(reversed_square != m){

                for(int i = 0; i <= reversed_square / 2; i++){
                    if(reversed_square == i * i){
                        if(checkPrime(i))
                        {
                            printf("%d\n", m);
                            count++;
                        }
                    }
                }
            }
        }
    }
    return 0;
}
