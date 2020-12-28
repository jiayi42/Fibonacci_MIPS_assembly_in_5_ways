#include<stdio.h>
int fo_ite( int n){
  if ( n <= 1 )return n;
  int i;int j=0;int j_=1;int k;// initialize fi=0 fi+1=1

  for(i=1;i<n;i++){
     k=j_;
     j_=j+j_;//fi+2=fi+fi+1
     j=k;//fi=fi+1
  }
  return j_;
}
int main(){
  int n,fac;
  scanf("%d", &n);
  printf("%d\n",fo_ite(n));

  return 0;
}
