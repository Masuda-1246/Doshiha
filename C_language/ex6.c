typedef volatile unsigned short hword;

#define VRAM 0x06000000
#define KEY 0x04000130
#define WHITE 0x07FF
#define BRACK 0x0000
#define BLUE 0x7C00
#define GREEN 0x03E0
#define RED 0x001F
#define AAA 0x111F
#define FIELD_WIDTH (12)
#define FIELD_HEIGT (22)
#define SHAPE_WIDTH_MAX (4)
#define SHAPE_HEIGHT_MAX (4)

enum{
	SHAPE_I,
	SHAPE_O,
	SHAPE_S,
	SHAPE_Z,
	SHAPE_J,
	SHAPE_L,
	SHAPE_T,
	SHAPE_MAX
};

typedef struct  {
	int width, height;
	int pattern[SHAPE_HEIGHT_MAX][SHAPE_WIDTH_MAX];
}SHAPE;

typedef struct  {
	int y,x;
	SHAPE shape;
}MINO;



SHAPE shapes[SHAPE_MAX] = {
	{
		4,4,
		{
			{0,0,0,0},
			{1,1,1,1},
			{0,0,0,0},
			{0,0,0,0}
		}
	},
	{
		2,2,
		{
			{1,1},
			{1,1}
		}
	},
	{
		3,3,
		{
			{0,1,1},
			{1,1,0},
			{0,0,0}
		}
	},
	{
		3,3,
		{
			{1,1,0},
			{0,1,1},
			{0,0,0}
		}
	},
	{
		3,3,
		{
			{1,0,0},
			{1,1,1},
			{0,0,0}
		}
	},
	{
		3,3,
		{
			{0,0,1},
			{1,1,1},
			{0,0,0}
		}
	},
	{
		3,3,
		{
			{0,1,0},
			{1,1,1},
			{0,0,0}
		}
	}
	
};

int mino_width;

void draw_square (int, int, hword);
void create_wall();
void create_mino();
void minomino();
void draw_mino(int, int, int);

MINO mino;
MINO new_mino;
int field[FIELD_HEIGT][FIELD_WIDTH];
int screen[FIELD_HEIGT][FIELD_WIDTH];
int main(void) {
	hword *ptr;
	hword color;
	hword key;
	hword *key_ptr;
	hword button_start;
	hword button_u;
	hword button_d;
	hword button_r;
	hword button_l;
	button_u = 0x0040;
	button_d = 0x0080;
	button_r = 0x0010;
	button_l = 0x0020;
	key_ptr = (hword*)KEY;
	key = *key_ptr;
	button_start = 0x0008;
	color = BRACK;
	ptr = (hword*)0x04000000;
	*ptr = 0x0F03;
	
	ptr = (hword*)VRAM;
	
	int i;
	int j;
	
	for (i = 0; i < 240*160; i++) {
		*ptr = color;
		ptr += 1;
	}
	color = WHITE;
	mino.x=3;
	while(1){
		int number = 0;
		int flag = 0;
		int mino_x;
		int mino_y;
		int x;
		int y;
		mino_x = mino.x;
		mino_y = mino.y;
		for (i = 0; i<100000; i++);
		key_ptr = (hword*)KEY;
		key = *key_ptr;
		if ((key&button_start)!=button_start){
			create_wall();
		}  
		if ((key & button_r) != button_r) {
			number = 1;
			mino.x 	+= 1;
		}else if ((key & button_l) != button_l) {
			number = 2;
			mino.x 	-= 1;
		}else if ((key & button_d) != button_d) {
			number = 3;
			mino.y 	+= 1;
		}else if ((key & button_u) != button_u) {
			number = 4;

			for ( y = 0; y < mino.shape.height;y++){
				for ( x = 0; x < mino.shape.width; x ++){
					new_mino.shape.pattern[mino.shape.width -1 -x][y] = mino.shape.pattern[y][x];
				}
			}
		}
		for (i = 0; i< FIELD_HEIGT; i++){
			for (j = 0; j < FIELD_WIDTH; j++){
				field[i][j] = screen[i][j];
				screen[i][j] = 0;
			}
		}
		for ( y = 0; y < mino.shape.height;y++){
			for ( x = 0; x < mino.shape.width; x ++){
				if (mino.shape.pattern[y][x]){
					if (mino.y + y < 0 || mino.y + y >= FIELD_HEIGT-1 || mino.x + x < 0 || mino.x + x >= FIELD_WIDTH){
						flag = 1;
						continue;
					}
				}
			}
		}
		if (flag) {
			switch (number)
			{
			case 1: mino.x -= 1;
				break;
			case 2: mino.x += 1;
				break;
			case 3: mino.y -= 1;
				break;
			default:
				break;
			}
		} else {
			mino.y ++;
		}
		create_wall();
		minomino();
		create_mino();
	}
	return 0;
}

void minomino()	{
	mino.shape.height = 3;
	mino.shape.width = 3;
	mino.shape.pattern[0][0] = 0;
	mino.shape.pattern[0][1] = 1;
	mino.shape.pattern[0][2] = 0;
	mino.shape.pattern[1][0] = 1;
	mino.shape.pattern[1][1] = 1;
	mino.shape.pattern[1][2] = 1;
	mino.shape.pattern[2][0] = 0;
	mino.shape.pattern[2][1] = 0;
	mino.shape.pattern[2][2] = 0;
}

void create_mino(){
	int a;
	int x;	
	int y;
	for ( y = 0; y < mino.shape.height;y++){
		for ( x = 0; x < mino.shape.width; x ++) {
			if (mino.shape.pattern[y][x]) {
				screen[mino.y+y][mino.x + x] |= 1;
			}
		}
	}
	for ( y = 0; y < FIELD_HEIGT;y++){
		for ( x = 0; x < FIELD_WIDTH; x ++){
			a = (screen[y][x] == 1)? 1:2;
			draw_mino(x,y,a);
		}
	}
}
void draw_mino(int x, int y,int a){
	hword color;
	color = (a==1)? GREEN:BRACK;
	x *= 6; 
	y *= 6; 
	x += 86;
	y += 20;
	draw_square(x,y,color);
}
void create_wall() {
	int i;
	int x1;
	int x2;
	int y;
	hword color;
	color = WHITE;
	x1 = 80;
	x2 = 158;
	y = 20;
	for (i = 0; i < 23; i++) {
		draw_square(x1, y + i * 6, color);
		draw_square(x2, y + i * 6, color);
	}
	y += 22 * 6;
	for (i = 0; i < 13; i++) {
		draw_square(x1 + i * 6,y, color);
	}
}

void draw_square (int x, int y, hword color){ 
 	hword *ptr;
    int i;
    int j;
	ptr = (hword*)VRAM;
	ptr+=240*y+x;
	for (i=0; i<5; i++) {
		for (j=0; j<5; j++) {
		*ptr = color;
		ptr +=1;
		}
		ptr += 235;
	}
}
