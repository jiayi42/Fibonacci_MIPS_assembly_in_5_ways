#include <stdio.h>

int fo_ite(int n,int a, int b) {
   if(n == 0){// recursive terminate when n==o return a
      return a;
   }
   else {
      return fo_ite(n-1,b,a+b);//here is the recursive
   }
}

int main() {
   int n;
   scanf("%d", &n);
   printf("%d \n",fo_ite(n,0,1));
}
