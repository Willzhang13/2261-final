# 1 "soundTime.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "soundTime.c"
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
# 2 "soundTime.c" 2
# 1 "soundTime.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 49 "soundTime.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 3 "soundTime.c" 2
# 1 "game.h" 1
# 9 "game.h"
extern int hOff;
extern int vOff;

int bossAlive();
int playerAlive();
void playerDashCDCounterPlus();
void playerDashCDStarts();

void openFirst();
void openSecond();
void openThird();
void openBoss();

void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();

void initEnemy0();
void updateEnemy0();
void drawEnemy0();

void initMinor1s();
void updateMinor1(MINOR1 *);
void drawMinor1s();

void initFireballs();
void updateFireball(FIREBALL *);
void drawFireballs();

void initEyeballs();
void updateEyeball(FIREBALL *);
void drawEyeballs();

void initWave();
void updateWave();
void drawWave();

void initBlockers();

enum {PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE, PLAYERLEFTATTACK, PLAYERRIGHTATTACK};
enum {BOSSRIGHT, BOSSLEFT};
# 4 "soundTime.c" 2

void setupSounds() {

    *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

 *(u16*)0x04000080 = 0;
}

void playSoundA( const signed char* sound, int length, int loops) {
    dma[1].cnt = 0;

    int ticks = (16777216) / 11025;

    DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    *(volatile unsigned short*)0x4000102 = 0;

    *(volatile unsigned short*)0x4000100 = -ticks;
    *(volatile unsigned short*)0x4000102 = (1<<7);

    soundA.data = sound;
    soundA.length = length;
    soundA.loops = loops;
    soundA.isPlaying = 1;
    soundA.duration = ((59.727) * length) / 11025;
    soundA.vBlankCount = 0;
}


void playSoundB( const signed char* sound, int length, int loops) {

    dma[2].cnt = 0;

    int ticks = (16777216) / 11025;

    DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    *(volatile unsigned short*)0x4000106 = 0;

    *(volatile unsigned short*)0x4000104 = -ticks;
    *(volatile unsigned short*)0x4000106 = (1<<7);

    soundB.data = sound;
    soundB.length = length;
    soundB.loops = loops;
    soundB.isPlaying = 1;
    soundB.duration = ((59.727) * length) / 11025;
    soundB.vBlankCount = 0;
}

void setupInterrupts() {

 *(unsigned short*)0x4000208 = 0;

    *(unsigned short*)0x4000200 |= 1 << 0 | 1<<5;
    *(unsigned short*)0x4000004 |= 1 << 3;

    *((ihp*)0x03007FFC) = interruptHandler;
 *(unsigned short*)0x4000208 = 1;
}

void interruptHandler() {

 *(unsigned short*)0x4000208 = 0;

 if(*(volatile unsigned short*)0x4000202 & 1 << 0) {
        if (soundA.isPlaying) {

            soundA.vBlankCount = soundA.vBlankCount + 1;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    *(volatile unsigned short*)0x4000102 = (0<<7);
                }
            }
        }

        if (soundB.isPlaying) {

            soundB.vBlankCount = soundB.vBlankCount + 1;
            if (soundB.vBlankCount > soundB.duration) {
                if (soundB.loops) {
                    playSoundB(soundB.data, soundB.length, soundB.loops);
                } else {
                    soundB.isPlaying = 0;
                    dma[2].cnt = 0;
                    *(volatile unsigned short*)0x4000106 = (0<<7);
                }
            }
  }




  *(volatile unsigned short*)0x4000202 = 1 << 0;
 }

    if ( *(volatile unsigned short*)0x4000202 & 1<<5 ) {
        playerDashCDCounterPlus();
        playerDashCDStarts();
        *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
    }

 *(unsigned short*)0x4000208 = 1;
}

void pauseSound() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);
}

void unpauseSound() {
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    *(volatile unsigned short*)0x4000102 = (1<<7);
    *(volatile unsigned short*)0x4000106 = (1<<7);
}

void stopSound() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);
    dma[1].cnt = 0;
    dma[2].cnt = 0;
}
