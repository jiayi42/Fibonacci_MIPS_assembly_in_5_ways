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

int * find_Q_matrix(int n){
    int* r= (int*)malloc(sizeof(int)*4);
    int* r_2= (int*)malloc(sizeof(int)*4);
    int* r_2_= (int*)malloc(sizeof(int)*4);
    if (n==1){
            return Q1;
    }
    else if(n%2==0){
        r=find_Q_matrix(n/2);
        return mmul(r,r);
    }
    else if(n%2==1){
        r_2=find_Q_matrix(n/2);
        r_2_=find_Q_matrix(n/2+1);
        return mmul(r_2,r_2_);
    }
}


int main() {
   int n;
   int* Q= (int*)malloc(sizeof(int)*4);
   scanf("%d", &n);
   if (n==0) printf("%d\n",0);
   else{
    Q=find_Q_matrix(n);
    printf("%d\n",Q[1]);
   }

}



