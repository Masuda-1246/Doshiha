typedef volatile unsigned short hword;

#define VRAM 0x06000000;
void draw_point (hword, hword, hword);
int main(void) {
	hword *ptr;
	hword color;
	hword x1;
	hword y1;
	hword key;
	hword *key_ptr;
	hword button_u;
	hword button_d;
	hword button_r;
	hword button_l;
	key_ptr = (hword*)0x04000130;
	key = *key_ptr;
	button_u = 0x0040;
	button_d = 0x0080;
	button_r = 0x0010;
	button_l = 0x0020;
	hword color1;
	ptr = (hword*)0x04000000;
	*ptr = 0x0F03;
	
	color = 0x7FE0;
	ptr = (hword*)VRAM;
	
	int i;
	int j;
	
	color1=0x001F;
	x1=112;
	y1=108;
	
	for (i = 0; i < 240*160; i++) {
		*ptr = color;
		ptr += 1;
	}
	
	while(1){
	for(j = 0; j < 10000; j++) {
		
	}
	key_ptr = (hword*)0x04000130;
	key = *key_ptr;
		if ((key&button_u)!=button_u) {
			draw_point (x1, y1, color);
			y1 -= 1;
		} else if ((key&button_d)!=button_d) {
			draw_point (x1, y1, color);
			y1 +=1; 
		} else if ((key&button_r)!=button_r) {
			draw_point (x1, y1, color);
			x1+=1;
		} else if ((key&button_l)!=button_l) {
			draw_point (x1, y1, color);
			x1 -= 1;		
		} 
	draw_point (x1, y1, color1);
	
	}
	return 0;
}

void draw_point (hword x, hword y, hword color){ 
 	hword *ptr;
	ptr = (hword*)VRAM;
	ptr+=240*y+x;
	*ptr=color;
}
