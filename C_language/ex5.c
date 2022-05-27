typedef volatile unsigned short hword;

#define VRAM 0x06000000;
void draw_point (hword, hword, hword);
void second();
int main(void) {
	hword *ptr;
	hword color;
	hword key;
	hword *key_ptr;
	hword button_start;
	key_ptr = (hword*)0x04000130;
	key = *key_ptr;
	button_start = 0x0008;
	color = 0x0000;
	ptr = (hword*)0x04000000;
	*ptr = 0x0F03;
	
	ptr = (hword*)VRAM;
	
	int i;
	
	for (i = 0; i < 240*160; i++) {
		*ptr = color;
		ptr += 1;
	}
	
	while(1){
		key_ptr = (hword*)0x04000130;
		key = *key_ptr;
		if ((key&button_start)!=button_start){
			
			second();
		}  
	}
	return 0;
}

void second(){
	hword *ptr;
	hword color;
	
	
	color = 0x07FE;
	
	ptr = (hword*)VRAM;
	
	int i;
	
	for (i = 0; i < 240*160; i++) {
		*ptr = color;
		ptr += 1;
	}
	
	while(1);
}
void draw_point (hword x, hword y, hword color){ 
 	hword *ptr;
	ptr = (hword*)VRAM;
	ptr+=240*y+x;
	*ptr=color;
}
