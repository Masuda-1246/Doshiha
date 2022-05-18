typedef volatile unsigned short hword;

#define VRAM 0x06000000

int main(void){
  hword *ptr;
  hword color;
  int i;

  ptr = (hword*)0x04000000;
  *ptr = 0x0F03;

  color = 0x7FFF;
  ptr = (hword*)VRAM;

  for (i=0;i<4;i++){
    *ptr = color;
    ptr += 0x00000002;
  }

  while(1);
  return 0;
}