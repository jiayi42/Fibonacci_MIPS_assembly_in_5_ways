#include <stdio.h>

int fo_ite(long int n) {
   if(n == 0){// recursive terminate when n==0 return 0
      return 0;
   } else if(n == 1) {// recursive terminate when n==1 return 1
      return 1;
   } else {
      return (fo_ite(n-1) + fo_ite(n-2));//here is the recursive ans add up
   }
}

int main() {
   long int n;
   scanf("%d", &n);
   printf("%d ",fo_ite(n));
}
