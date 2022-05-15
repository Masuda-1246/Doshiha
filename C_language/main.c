#include <stdio.h>
int main(void){
  int num = 1;
  int *ptr;
  ptr = &num;
  printf("num = %d \n", num);
  printf("ptr = %d", *ptr);
  return 0;
}