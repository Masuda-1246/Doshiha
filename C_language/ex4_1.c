typedef volatile unsigned short hword;

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
	
	for (i = 0; i < 160; i++) {
		for (j=0; j< 240; j++){
			*ptr = (xa<=j&&ya<=i&&j<=xb&&i<=yb)? color1:color;
			ptr += 1;
		}
	}
	
	while(1)
	return 0;
}

