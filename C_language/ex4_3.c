typedef volatile unsigned short hword;
#include <math.h>

#define VRAM 0x06000000;
void draw_point (hword, hword, hword);
int main(void) {
	hword *ptr;
	hword color;
	hword color1;
	hword xa;
	hword ya;
	hword xb;
	hword yb;
	hword a;
	hword answer;
	
	ptr = (hword*)0x04000000;
	*ptr = 0x0F03;
	
	color = 0x7FE0;
	ptr = (hword*)VRAM;
	
	int i;
	int j;
	
	color1=0x001F;
	xa=112;
	ya=108;
	xb=112;
	yb=108;
  a = (yb-ya)/(xa-xb);
	
	for (i = 0; i < 160*240; i++) {
			*ptr = color;
			ptr += 1;
	}

  for (i=0; i<xb-xa; i++){
    ptr = (hword*)VRAM;
    answer = ((xa + i) + (ya+round(a*i))*240);
    ptr += answer;
    *ptr = color1;
  }
	while(1)
	return 0;
}

