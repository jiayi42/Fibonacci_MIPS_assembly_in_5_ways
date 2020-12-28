#include <stdio.h>
#include <stdlib.h>
int Q1[4] = {1 , 1 , 1 , 0 };

int * mmul(int* m1,int* m2){
    int* r= (int*)malloc(sizeof(int)*4);
    r[0]=m1[0]*m2[0]+m1[1]*m2[2];
    r[1]=m1[0]*m2[1]+m1[1]*m2[3];
    r[2]=m1[2]*m2[0]+m1[3]*m2[2];
    r[3]=m1[2]*m2[1]+m1[3]*m2[3];
    return r;
}

int main() {
   int n;
   scanf("%d", &n);
   int* Q2 = mmul(Q1, Q1);
   int* Q3 = mmul(Q1, Q2);
   if (n==0)printf("0\n");
   else if (n>0 && n<=3){
    printf("%d\n",Q2[3-n]);
   }
   else{
       while(n>3){//while loop for needed time call mmul
       if ((n%2==0) && (n!=4)){
       Q3 = mmul(Q1, Q2);
       Q2 = Q3;//Qi+1=Qi
       Q3 = mmul(Q1, Q2);
       Q2 = Q3;//Qi+1=Qi
       n=n-2;
       }
        else{
        Q3 = mmul(Q1, Q2);
        Q2 = Q3;//Qi+1=Qi
        n--;
        }

       }
       printf("%d\n",Q3[0]);
   }


}
