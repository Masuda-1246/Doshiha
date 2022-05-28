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
#define VEROSITY (50000)

typedef volatile unsigned short hword;

//ミノの座標のコンストラクタ
typedef struct  {
	int width, height;
	int pattern[SHAPE_HEIGHT_MAX][SHAPE_WIDTH_MAX];
}SHAPE;

//ミノの形、種類、座標のコンストらくた
typedef struct  {
	int y,x;
	SHAPE shape;
}MINO;

//マスを描画
void draw_square (int, int, hword);
//ミノを描画
void draw_mino(int, int, int);
//周りの壁を作成・描画
void create_wall();
//ミノを作成
void create_mino();

//各ミノの座標を定義
void mino_i();
void mino_o();
void mino_t();
void mino_s();
void mino_z();
void mino_j();
void mino_l();

//startボタンでスタートする
void start();

//ゲームが終了したときに出てくる画面
void finish();

//ミノの初期化
MINO mino;
MINO mino1;

//1つのミノの座標
int field[FIELD_HEIGT][FIELD_WIDTH];
//全てのミノの座標
int screen[FIELD_HEIGT][FIELD_WIDTH];

int main(void) {
	hword *ptr;
	hword color;
	hword key;
	hword *key_ptr;
	hword button_start;
	key_ptr = (hword*)KEY;
	key = *key_ptr;
	button_start = 0x0008;
	color = BRACK;
	ptr = (hword*)0x04000000;
	*ptr = 0x0F03;
	ptr = (hword*)VRAM;	
	int i;
	for (i = 0; i < 240*160; i++) {
		*ptr = color;
		ptr += 1;
	}
	while(1){
		key_ptr = (hword*)KEY;
		key = *key_ptr;
    //startボタンを押下するとゲームが始まる
		if ((key&button_start)!=button_start){
			start();
		}  
	}

}
void start()	{
	hword color;
	hword key;
	hword *key_ptr;
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
	color = BRACK;
	
	int i;
	int j;
    int count = 0;
	//初期化
	for (i = 0; i< FIELD_HEIGT; i++){
			for (j = 0; j < FIELD_WIDTH; j++){
				screen[i][j] = 0;
				field[i][j] = 0;
		}
	}
	color = WHITE;
  //初めのx座標
	mino.x=5;
	mino_s();
	create_wall();
	while(1){
		int number = 0;
		int flag = 0;
		int x;
		int y;
		int y2;
		for (i = 0; i<VEROSITY; i++);
		key_ptr = (hword*)KEY;
		key = *key_ptr;
    //各キーでのミノの移動
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
			mino1.shape.height = mino.shape.height;
			mino1.shape.width = mino.shape.width;
			for ( y = 0; y < mino.shape.height;y++){
				for ( x = 0; x < mino.shape.width; x ++){
					mino1.shape.pattern[mino.shape.width -1 -x][y] = mino.shape.pattern[y][x];
				}
			}
			for ( y = 0; y < mino.shape.height;y++){
				for ( x = 0; x < mino.shape.width; x ++){
					mino.shape.pattern[y][x] = mino1.shape.pattern[y][x];
				}
			}
		}
    //一度初期化配列を0で初期化
		for (i = 0; i< FIELD_HEIGT; i++){
			for (j = 0; j < FIELD_WIDTH; j++){
				screen[i][j] = 0;
			}
		}
    //あたり判定
		for ( y = 0; y < mino.shape.height;y++){
			for ( x = 0; x < mino.shape.width; x ++){
				if (mino.shape.pattern[y][x]){
					if (mino.y + y < 0 || mino.y + y >= FIELD_HEIGT-1 || mino.x + x < 0 || mino.x + x >= FIELD_WIDTH){
						flag = 1;
						continue;
					}
					if (field[mino.y+y+1][mino.x+x]){
						flag = 1;
						continue;
					}
				}
			}
		}
    //当たり判定での動作
		if (flag) {
			switch (number)
			{
			case 1: mino.x -= 1;
				break;
			case 2: mino.x += 1;
				break;
			case 3: mino.y -= 1;
				break;
        //ミノが一番下、あるいはブロックの上にいるときの処理
			default:
        //ミノを全てのミノを格納する配列に格納
				for ( y = 0; y < mino.shape.height;y++){
					for ( x = 0; x < mino.shape.width; x ++){
						if (mino.shape.pattern[y][x]){
							field[mino.y+y][mino.x+x] = 1;
						}
					}
				}
        //列が揃った場合に削除し、下に詰める
				for (y = 0; y < FIELD_HEIGT; y++) {
					int complete = 1;
					for ( x = 0; x < FIELD_WIDTH; x++){	
						if (!field[y][x]) {
							complete = 0;
							break;
						}
					}
					if (complete) {
						for ( x = 0; x < FIELD_WIDTH; x++){
							field[y][x] = 0;
						}
						for (y2=y; y2>=1;y2--) {
							for ( x = 0; x < FIELD_WIDTH; x++){
								field[y2][x] = field[y2-1][x];
							}
						}
					}
				}
				for ( x = 0; x < FIELD_WIDTH; x++){	
					if (field[0][x]==1){
						finish();
					}
				}
        //ミノの初期化と形の変更
				mino.y = 0;
				mino.x = 5;
					if ( count == 0){mino_i();}
					else if ( count == 1){mino_j();}
					else if ( count == 2){mino_l();}
					else if ( count == 3){mino_t();}
					else if ( count == 4){mino_s();}
					else if ( count == 5){mino_z();}
					else if ( count == 6){mino_o();}
				count ++;
				count = (count==7)? 0:count;
				break;
			}
		} else {
				mino.y ++;
		}
			create_mino();
		}
}

void finish(){
	int i;
	int j;
	hword key;
	hword *key_ptr;
	hword button_start;
	button_start = 0x0008;
	for (i = 0; i< FIELD_HEIGT; i++){
			for (j = 0; j < FIELD_WIDTH; j++){
				screen[i][j] = 1;
		}
	}
	create_mino();
	while(1){
		key_ptr = (hword*)KEY;
		key = *key_ptr;
    	//startボタンを押下するとゲームが始まる
		if ((key&button_start)!=button_start){
			start();
		}  
	}	
}

void mino_i()	{
	mino.shape.height = 4;
	mino.shape.width = 4;
	mino.shape.pattern[0][0] = 0;
	mino.shape.pattern[0][1] = 0;
	mino.shape.pattern[0][2] = 0;
	mino.shape.pattern[0][3] = 0;
	mino.shape.pattern[1][0] = 1;
	mino.shape.pattern[1][1] = 1;
	mino.shape.pattern[1][2] = 1;
	mino.shape.pattern[1][3] = 1;
	mino.shape.pattern[2][0] = 0;
	mino.shape.pattern[2][1] = 0;
	mino.shape.pattern[2][2] = 0;
	mino.shape.pattern[2][3] = 0;
	mino.shape.pattern[3][0] = 0;
	mino.shape.pattern[3][1] = 0;
	mino.shape.pattern[3][2] = 0;
	mino.shape.pattern[3][3] = 0;
}
void mino_o()	{
	mino.shape.height = 2;
	mino.shape.width = 2;
	mino.shape.pattern[0][0] = 1;
	mino.shape.pattern[0][1] = 1;
	mino.shape.pattern[1][0] = 1;
	mino.shape.pattern[1][1] = 1;
}
void mino_t()	{
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
void mino_s()	{
	mino.shape.height = 3;
	mino.shape.width = 3;
	mino.shape.pattern[0][0] = 0;
	mino.shape.pattern[0][1] = 1;
	mino.shape.pattern[0][2] = 1;
	mino.shape.pattern[1][0] = 1;
	mino.shape.pattern[1][1] = 1;
	mino.shape.pattern[1][2] = 0;
	mino.shape.pattern[2][0] = 0;
	mino.shape.pattern[2][1] = 0;
	mino.shape.pattern[2][2] = 0;
}
void mino_z()	{
	mino.shape.height = 3;
	mino.shape.width = 3;
	mino.shape.pattern[0][0] = 1;
	mino.shape.pattern[0][1] = 1;
	mino.shape.pattern[0][2] = 0;
	mino.shape.pattern[1][0] = 0;
	mino.shape.pattern[1][1] = 1;
	mino.shape.pattern[1][2] = 1;
	mino.shape.pattern[2][0] = 0;
	mino.shape.pattern[2][1] = 0;
	mino.shape.pattern[2][2] = 0;
}
void mino_j()	{
	mino.shape.height = 3;
	mino.shape.width = 3;
	mino.shape.pattern[0][0] = 1;
	mino.shape.pattern[0][1] = 0;
	mino.shape.pattern[0][2] = 0;
	mino.shape.pattern[1][0] = 1;
	mino.shape.pattern[1][1] = 1;
	mino.shape.pattern[1][2] = 1;
	mino.shape.pattern[2][0] = 0;
	mino.shape.pattern[2][1] = 0;
	mino.shape.pattern[2][2] = 0;
}
void mino_l()	{
	mino.shape.height = 3;
	mino.shape.width = 3;
	mino.shape.pattern[0][0] = 0;
	mino.shape.pattern[0][1] = 0;
	mino.shape.pattern[0][2] = 1;
	mino.shape.pattern[1][0] = 1;
	mino.shape.pattern[1][1] = 1;
	mino.shape.pattern[1][2] = 1;
	mino.shape.pattern[2][0] = 0;
	mino.shape.pattern[2][1] = 0;
	mino.shape.pattern[2][2] = 0;
}

//ミノを表示させる
void create_mino(){
	int a;
	int x;	
	int y;
	for ( y = 0; y < mino.shape.height;y++){
		for ( x = 0; x < mino.shape.width; x ++) {
			if (mino.shape.pattern[y][x]) {
				screen[mino.y+y][mino.x + x] = 1;
			}
		}
	}
	for ( y = 0; y < FIELD_HEIGT;y++){
		for ( x = 0; x < FIELD_WIDTH; x ++){
			a = (screen[y][x] == 1 || field[y][x]==1)? 1:2;
			draw_mino(x,y,a);
		}
	}
}

//配列をVRAMで表せるように微調整
void draw_mino(int x, int y,int a){
	hword color;
	color = (a==1)? GREEN:BRACK;
	x *= 6; 
	y *= 6; 
	x += 86;
	y += 20;
	draw_square(x,y,color);
}

//ミノの範囲を示す壁を作成
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

//ミノや壁の基本となる四角を描画
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
