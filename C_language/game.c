typedef volatile unsigned short hword;

#define VRAM 0x06000000;

void move_snake (int, int, hword, int, int, hword);
void create_snake (hword);
int main(void) {
	int i;
	int j;
	int xt;
	int yt;
	int xb;
	int yb;
	hword *ptr;
	hword key;
	hword *key_ptr;
	hword button_u;
	hword button_d;
	hword button_r;
	hword button_l;
	hword color;
	hword color1;
	xt=100;
	yt=100;
	xb=80;
	yb=100;
	button_u = 0x0040;
	button_d = 0x0080;
	button_r = 0x0010;
	button_l = 0x0020;
	color = 0x7FE0;
	color1=0x001F;

	key_ptr = (hword*)0x04000130;
	key = *key_ptr;
	ptr = (hword*)0x04000000;
	
	for (i = 0; i < 240*160; i++) {
		*ptr = color;
		ptr += 1;
	}
  create_snake(color1);
	
	while(1){
	for(j = 0; j < 10000; j++) {
		
	}
	key_ptr = (hword*)0x04000130;
	key = *key_ptr;
		if ((key&button_u)!=button_u) {
      yt += 1;
      move_snake(xt, yt, color, xb, yb, color1);
      yb += 1;
		} else if ((key&button_d)!=button_d) {
      yt -= 1;
      move_snake(xt, yt, color, xb, yb, color1);
      yb -= 1;
		} else if ((key&button_r)!=button_r) {
      xt += 1;
      move_snake(xt, yt, color, xb, yb, color1);
      xb += 1;
		} else if ((key&button_l)!=button_l) {
      xt -= 1;
      move_snake(xt, yt, color, xb, yb, color1);
      xb -= 1;
		} 
	}
	return 0;
}

void create_snake (hword color) {
  hword *ptr;
  ptr = (hword*)VRAM;
  int i;
  ptr+=240*100+100;
  for (i=0; i<20; i++) {
    *ptr=color;
    ptr += 1;
  }
}

void move_snake (int xt, int yt, hword color, int xb, int yb, hword color1) {
  hword *top_ptr;
	hword *bottom_ptr;
	top_ptr = (hword*)VRAM;
	bottom_ptr = (hword*)VRAM;
  top_ptr += yt*240 + xt;
  bottom_ptr += yb*240 + xb;
  *top_ptr = color1;
  *bottom_ptr = color;
}
