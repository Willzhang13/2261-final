# 1 "mode0.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mode0.c"
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
# 2 "mode0.c" 2


unsigned volatile short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


void setPixel3(int col, int row, unsigned short color) {
    videoBuffer[((row) * (240) + (col))] = color;
}


void setPixel4(int col, int row, unsigned char colorIndex) {
    volatile unsigned short pixelData = videoBuffer[((row) * (240) + (col)) / 2];
    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= colorIndex << 8;
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((row) * (240) + (col)) / 2] = pixelData;
}


void drawRect3(int col, int row, int width, int height, volatile unsigned short color) {
    for (int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[((row + r) * (240) + (col))], (2 << 23) | width);
    }
}


void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    for (int r = 0; r < height; r++) {

        if (width == 1)
            setPixel4(col, row + r, colorIndex);
        else if (width == 2) {
            setPixel4(col, row + r, colorIndex);
            setPixel4(col + 1, row + r, colorIndex);
        } else if ((col & 1) && (width & 1)) {
            setPixel4(col, row + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((row + r) * (240) + (col + 1)) / 2], (2 << 23) | (width - 1) / 2);
        } else if (width & 1) {
            DMANow(3, &pixelData, &videoBuffer[((row + r) * (240) + (col)) / 2], (2 << 23) | (width - 1) / 2);
            setPixel4(col + width - 1, row + r, colorIndex);
        } else if (col & 1) {
            setPixel4(col, row + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((row + r) * (240) + (col + 1)) / 2], (2 << 23) | (width - 2) / 2);
            setPixel4(col + width - 1, row + r, colorIndex);
        } else {
            DMANow(3, &pixelData, &videoBuffer[((row + r) * (240) + (col)) / 2], (2 << 23) | width / 2);
        }
    }
}


void fillScreen3(volatile unsigned short color) {
    unsigned short c = color;
    DMANow(3, &c, videoBuffer, (2 << 23) | (240 * 160));
}


void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, (2 << 23) | (240 * 160) / 2);
}


void drawImage3(int col, int row, int width, int height, const unsigned short *image) {
    for (int r = 0; r < height; r++) {
        if (row + r < 0) continue;
        DMANow(3, &image[((r) * (width) + (0))], &videoBuffer[((row + r) * (240) + (col))], width);
    }
}


void drawImage4(int col, int row, int width, int height, const unsigned short *image) {
    for (int i = 0; i < height; i++) {
        if (row + i < 0) continue;
        DMANow(3, &image[((i) * (width / 2) + (0))], &videoBuffer[((row + i) * (240) + (col)) / 2], width / 2);
    }
}


void drawFullscreenImage3(const unsigned short *image) {
    DMANow(3, image, videoBuffer, 240 * 160);
}


void drawFullscreenImage4(const unsigned short *image) {
    DMANow(3, image, videoBuffer, 240 * 160 / 2);
}


void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}


void flipPage() {
    if ((*(volatile unsigned short *)0x4000000) & (1 << 4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(volatile unsigned short *)0x4000000) ^= (1 << 4);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    dma[channel].cnt = 0;


    dma[channel].src = src;
    dma[channel].dst = dst;


    dma[channel].cnt = cnt | (1 << 31);
}


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA < rowB + heightB - 1
    && rowA + heightA - 1 > rowB
    && colA < colB + widthB - 1
    && colA + widthA - 1 > colB;
}


void hideSprites() {

    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2 << 8);
    }
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);
}

int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height, int colShift, int rowShift) {
    int smallestSoFar = 256;
    int current;


    current = collisionMap[((row + rowShift) * (mapWidth) + (col + colShift))];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }


    current = collisionMap[((row + rowShift) * (mapWidth) + (col + width + colShift -1))];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }


    current = collisionMap[((row + height + rowShift - 1) * (mapWidth) + (col + colShift))];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }


    current = collisionMap[((row + height + rowShift - 1) * (mapWidth) + (col + width + colShift -1))];
    if (current < smallestSoFar) {
        smallestSoFar = current;
    }

    return smallestSoFar;
}
