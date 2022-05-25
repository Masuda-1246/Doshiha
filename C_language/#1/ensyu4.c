typedef volatile unsigned short hword;

#define VRAM 0x06000000

int main(void){
  hword *ptr;
  hword color;
  hword button;
  hword *key;
  hword key_ptr;
  ptr = (hword*)0x04000000;
  *ptr = 0x0F03;
  button = 0x0002;
  key = (hword*)0x04000130;

  while(1)[
    key_ptr = *key;
    if ((key_ptr&button) != button) {
      color = 0x7FFF;
    } else {
      color = 0x7FE0;
    }

    ptr = (hword*)VRAM;

    *ptr = color;
  ]

  return 0;
}