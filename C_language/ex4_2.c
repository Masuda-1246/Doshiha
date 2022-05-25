typedef volatile unsigned short hword;
#include <math.h>

#define VRAM 0x06000000;
void draw_point (hword, hword, hword);
int main(void) {
	hword *ptr;
	hword color;
	hword color1;
	hword xe;
	hword ye;
	hword r;
	
	ptr = (hword*)0x04000000;
	*ptr = 0x0F03;
	
	color = 0x7FE0;
	ptr = (hword*)VRAM;
	
	int i;
	int j;
	
	color1=0x001F;
	xe=112;
	ye=108;
	r=108;
	
	for (i = 0; i < 160; i++) {
		for (j=0; j< 240; j++){
			*ptr = (pow((xe-i),2.0)+pow((ye-i),2.0) <= pow(r,2.0))? color1:color;
			ptr += 1;
		}
	}
	
	while(1)
	return 0;
}

