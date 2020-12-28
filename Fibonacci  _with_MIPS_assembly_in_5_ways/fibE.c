#include <stdio.h>
#include <stdlib.h>
int fo_dfast( int n){
   int f2,f2_,f_2;
   if (n==0)return 0;
   else {
    int i=1, f=1,f_=1;
    while(i<n){
        if(i<=(n/2)){
            f2_=f*f+f_*f_;//f2i+1=fi^2+fi+1^2
            f2=f*(2*f_-f);//f2i=fi(2fi+1-fi)
            f=f2;//fi=f2i
            f_=f2_;//fi+1=f2i+1
            i=i*2;
        }
        else{
            f_2=f_+f;//fi+2=fi+1+fi
            f=f_;//fi=fi+1
            f_=f_2;//fi+1=fi+2
            i=i+1;
        }
     }
    return f;
    }
}
int main() {
   int n;
   scanf("%d", &n);
   printf("%d\n",fo_dfast(n));

}
