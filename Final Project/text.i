# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
# 1 "mode0.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 62 "mode0.h"
extern volatile unsigned short *videoBuffer;
# 83 "mode0.h"
typedef struct {
    u16 tileimg[8192];
} charblock;


typedef struct {
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();


typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 152 "mode0.h"
void hideSprites();
int collisionCheck();







typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int health;
    int attacking;

    int meleeing;
    int meleeCounter;
    int meleeable;
    int meleeDamage;

    int fireballing;
    int fireballCounter;
    int fireballable;
    int fireballDamage;

    int dashCD;
    int dashing;
    int dashingCounter;
    int dashable;
    int dashDamage;
    int dashCDcounter;
    int dashCDstarts;

    int swingCD;
    int swinging;
    int swingingCounter;
    int swingable;
    int swingDamage;
    int swingCDcounter;
    int swingCDstarts;

    int slamCD;
    int slamming;
    int slammingCounter;
    int slammable;
    int slamDamage;
    int slamCDcounter;
    int slamCDstarts;

    int waving;
    int wavingCounter;
    int wavable;
    int waveDamage;

    int shielding;
    int shieldDuration;
    int shieldable;
    int shieldCounter;
    int shieldHide;

    int healable;
    int healCD;
    int healAmount;
    int healCDcounter;
    int healCDstarts;
    int healing;
    int healingCounter;
    int healHide;
} PLAYER;

typedef struct {
    int health;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int moveCounter;
    int width;
    int height;

    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;

    int dashed;
    int slammed;
    int meleed;
    int waved;

    int meleeing;
    int meleeCounter;
    int meleeable;
    int meleeDamage;
    int meleeCD;
    int meleeCDstarts;
    int meleeCDcounter;

    int explodeCD;
    int exploding;
    int explodingCounter;
    int explodable;
    int explodeDamage;
    int explodeCDcounter;
    int explodeCDstarts;
    int explodeMode;

} ENEMY0;

typedef struct {
    int health;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int moveCounter;
    int width;
    int height;

    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;

    int dashed;
    int slammed;
    int meleed;
    int waved;

    int meleeing;
    int meleeCounter;
    int meleeable;
    int meleeDamage;
    int meleeCD;
    int meleeCDstarts;
    int meleeCDcounter;
} MINOR1;

typedef struct {
 int worldRow;
    int worldCol;
    int rdel;
    int cdel;
 int height;
 int width;
 int hide;
    int left;
    int right;
    int up;
    int down;
} FIREBALL;

typedef struct {
 int worldRow;
    int worldCol;
    int rdel;
    int cdel;
 int height;
 int width;
 int hide;
    int left;
    int right;
} WAVE;

typedef struct {
 int worldRow;
    int worldCol;
 int height;
 int width;
 int active;
} BLOCKER;
# 361 "mode0.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 409 "mode0.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 448 "mode0.h"
typedef void (*ihp)(void);
# 2 "text.c" 2
# 1 "text.h" 1
void drawDigits0(int col, int row, int num, int oam);
# 3 "text.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 4 "text.c" 2

void drawDigits0(int col, int row, int num, int oam) {
    int s = 0;

    int t = 0;
    if ((num < 100) && (num >= 0)) {
        s = num % 10;
        t = num / 10;
    }

    shadowOAM[oam].attr0 = row | (0 << 13) | (0 << 14);
 shadowOAM[oam].attr1 = col | (0 << 14);
 shadowOAM[oam].attr2 = ((0) << 12) | ((31)*32 + (t));

    shadowOAM[oam + 1].attr0 = row | (0 << 13) | (0 << 14);
 shadowOAM[oam + 1].attr1 = (col + 8) | (0 << 14);
 shadowOAM[oam + 1].attr2 = ((0) << 12) | ((31)*32 + (s));
}
