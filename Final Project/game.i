# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2
# 1 "background0.h" 1
# 22 "background0.h"
extern const unsigned short background0Tiles[9664];


extern const unsigned short background0Map[4096];


extern const unsigned short background0Pal[256];
# 4 "game.c" 2
# 1 "text.h" 1
void drawDigits0(int col, int row, int num, int oam);
# 5 "game.c" 2
# 1 "collisionmap.h" 1
# 20 "collisionmap.h"
extern const unsigned short collisionmapBitmap[131072];
# 6 "game.c" 2
# 1 "UI.h" 1
# 22 "UI.h"
extern const unsigned short UITiles[864];


extern const unsigned short UIMap[1024];


extern const unsigned short UIPal[256];
# 7 "game.c" 2

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
# 9 "game.c" 2
# 1 "meleeSound.h" 1


extern const unsigned int meleeSound_sampleRate;
extern const unsigned int meleeSound_length;
extern const signed char meleeSound_data[];
# 10 "game.c" 2
# 1 "dashSound.h" 1


extern const unsigned int dashSound_sampleRate;
extern const unsigned int dashSound_length;
extern const signed char dashSound_data[];
# 11 "game.c" 2
# 1 "slamSound.h" 1


extern const unsigned int slamSound_sampleRate;
extern const unsigned int slamSound_length;
extern const signed char slamSound_data[];
# 12 "game.c" 2
# 1 "swingSound.h" 1


extern const unsigned int swingSound_sampleRate;
extern const unsigned int swingSound_length;
extern const signed char swingSound_data[];
# 13 "game.c" 2
# 1 "waveSound.h" 1


extern const unsigned int waveSound_sampleRate;
extern const unsigned int waveSound_length;
extern const signed char waveSound_data[];
# 14 "game.c" 2
# 1 "fireballSound.h" 1


extern const unsigned int fireballSound_sampleRate;
extern const unsigned int fireballSound_length;
extern const signed char fireballSound_data[];
# 15 "game.c" 2

OBJ_ATTR shadowOAM[128];
PLAYER player;
ENEMY0 enemy0;
MINOR1 minor1s[3];
FIREBALL fireballs[5];
FIREBALL eyeballs[4];
BLOCKER blockers[4];
WAVE wave;
int hOff;
int vOff;
int screenBlock;
int hOfflimit;
int door1Opened;
int door2Opened;
int door3Opened;
int BossOpened;
int enemykilled;
int cheat;
int swordPalr;
int wavePalr;
int firePalr;
unsigned char* collisionMap = (unsigned char*) collisionmapBitmap;

void initGame() {
    DMANow(3, background0Tiles, &((charblock *)0x6000000)[1], 19328 / 2);
    DMANow(3, background0Map, &((screenblock *)0x6000000)[27], 8192 / 2);
    cheat = 0;
    (*(volatile unsigned short *)0x04000016) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;
    enemykilled = 0;
    vOff = 0;
    hOff = 0;
    screenBlock = 27;
    hOfflimit = 0;
    door1Opened = 0;
    door2Opened = 0;
    door3Opened = 0;
    BossOpened = 0;
    swordPalr = 1;
    wavePalr = 3;
    firePalr = 2;
    (*(volatile unsigned short *)0x400000A) = ((1) << 2) | ((screenBlock) << 8) | (1 << 14) | (0 << 7);
    initBlockers();
    initPlayer();
    initEnemy0();
    initMinor1s();
    initFireballs();
    initEyeballs();
    initWave();
}

int bossAlive() {
    if (enemy0.health > 0) {
        return 1;
    } else {
        return 0;
    }
}

int playerAlive() {
    if (player.health > 0) {
        return 1;
    } else {
        return 0;
    }
}

void playerDashCDCounterPlus() {
    player.dashCDcounter++;
}

void playerDashCDStarts() {
    player.dashCDstarts = 1;
}

void openFirst() {
    door1Opened = 1;
    for (int i = 22; i <= 31; i++) {
        for (int j = 12; j < 14; j++) {
            ((screenblock *)0x6000000)[27].tilemap[((i) * (32) + (j))] = ((screenblock *)0x6000000)[27].tilemap[((i) * (32) + (j + 2))];
        }
    }
    blockers[0].active = 0;
    minor1s[0].worldRow = 136;
    minor1s[0].worldCol = 432;
    minor1s[0].hide = 0;
    minor1s[1].worldRow = 223;
    minor1s[1].worldCol = 300;
    minor1s[1].hide = 0;
}

void openSecond() {
    door2Opened = 1;
    for (int i = 12; i <= 15; i++) {
        for (int j = 30; j < 32; j++) {
            ((screenblock *)0x6000000)[27].tilemap[((i) * (32) + (j))] = ((screenblock *)0x6000000)[27].tilemap[((i-8) * (32) + (j))];
        }
    }
    for (int i = 12; i <= 15; i++) {
        for (int j = 0; j <= 7; j++) {
            ((screenblock *)0x6000000)[28].tilemap[((i) * (32) + (j))] = ((screenblock *)0x6000000)[28].tilemap[((i-8) * (32) + (j))];
        }
    }
    blockers[1].active = 0;
    minor1s[0].worldRow = 63;
    minor1s[0].worldCol = 129;
    minor1s[0].hide = 0;
    minor1s[1].worldRow = 56;
    minor1s[1].worldCol = 440;
    minor1s[1].hide = 0;
}

void openThird() {
    door3Opened = 1;
    for (int i = 1; i <= 10; i++) {
        for (int j = 28; j <= 31; j++) {
            ((screenblock *)0x6000000)[28].tilemap[((i) * (32) + (j))] = ((screenblock *)0x6000000)[27].tilemap[((i) * (32) + (j - 4))];
        }
    }
    blockers[2].active = 0;
}

void openBoss() {
    blockers[3].active = 0;
    BossOpened = 1;
    enemy0.hide = 0;
    enemy0.worldCol = 800;
    enemy0.worldRow = 100;

    for (int i = 0; i <= 31; i++) {
        for (int j = 0; j <= 3; j++) {
            ((screenblock *)0x6000000)[30].tilemap[((i) * (32) + (j))] = ((screenblock *)0x6000000)[30].tilemap[((i) * (32) + (j + 4))];
        }
    }
}

void updateGame() {
    if ((!(~(oldButtons) & ((1 << 2))) && (~buttons & ((1 << 2))))) {
        cheat = (cheat + 1) % 2;
    }
    if (cheat) {
        player.meleeDamage = 4;
        player.fireballDamage = 4;
        player.waveDamage = 4;
        player.dashDamage = 2;
        player.swingDamage = 2;
        player.slamDamage = 7;
        player.dashCD = 1;
        player.swingCD = 100;
        player.slamCD = 100;
        player.shieldDuration = 600;
        player.healCD = 100;
        swordPalr = 5;
        firePalr = 5;
        wavePalr = 5;
    } else {
        player.meleeDamage = 2;
        player.fireballDamage = 1;
        player.waveDamage = 2;
        player.dashDamage = 1;
        player.swingDamage = 1;
        player.slamDamage = 3;
        player.dashCD = 3;
        player.swingCD = 300;
        player.slamCD = 300;
        player.shieldDuration = 300;
        player.healCD = 500;
        swordPalr = 1;
        firePalr = 2;
        wavePalr = 3;
    }
 updatePlayer();
    updateEnemy0();
    for (int i = 0; i < 5; i++) {
  updateFireball(&fireballs[i]);
 }
    for (int i = 0; i < 4; i++) {
  updateEyeball(&eyeballs[i]);
 }
    for (int i = 0; i < 3; i++) {
  updateMinor1(&minor1s[i]);
 }
 updateWave();

    if (collisionMap[((player.worldRow + player.height / 2) * (1024) + (player.worldCol + player.width))]== 1) {
        if (!door1Opened && (enemykilled >= 1))
            openFirst();
    }

    if (collisionMap[((player.worldRow) * (1024) + (player.worldCol + player.width / 2))] == 2) {
        if (!door2Opened && (enemykilled >= 3))
            openSecond();
    }

    if (collisionMap[((player.worldRow + player.height / 2) * (1024) + (player.worldCol + player.width))]== 3) {
        if (!door3Opened && (enemykilled >= 5))
            openThird();
    }

    if (collisionMap[((player.worldRow + player.height / 2) * (1024) + (player.worldCol + player.width))]== 4) {
        if (!BossOpened && (enemykilled >= 8))
            openBoss();
    }

    if (player.worldCol >= 490 && player.worldCol < 512) {
        screenBlock = 29;
        hOff = 0;
        hOfflimit = 512;
        (*(volatile unsigned short *)0x400000A) = ((1) << 2) | ((screenBlock) << 8) | (1 << 14) | (0 << 7);
        player.worldCol = 520;
        player.worldRow = 16;
        minor1s[0].worldRow = 9;
        minor1s[0].worldCol = 600;
        minor1s[0].hide = 0;
        minor1s[1].worldRow = 200;
        minor1s[1].worldCol = 537;
        minor1s[1].hide = 0;
        minor1s[2].worldRow = 128;
        minor1s[2].worldCol = 705;
        minor1s[2].hide = 0;
    }


    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x04000016) = vOff;
}

void drawGame() {

    drawPlayer();
    drawEnemy0();
    drawMinor1s();
 drawFireballs();
    drawEyeballs();
    drawWave();

    if (!player.wavable) {
        shadowOAM[18].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[18].attr1 = 15 | (0 << 14);
     shadowOAM[18].attr2 = ((0) << 12) | ((30)*32 + (0));
    } else {
        shadowOAM[18].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[18].attr1 = 15 | (0 << 14);
     shadowOAM[18].attr2 = ((0) << 12) | ((31)*32 + (10));
    }

    if (!player.swingable) {
        shadowOAM[19].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[19].attr1 = 28 | (0 << 14);
     shadowOAM[19].attr2 = ((0) << 12) | ((30)*32 + (0));
    } else {
        shadowOAM[19].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[19].attr1 = 28 | (0 << 14);
     shadowOAM[19].attr2 = ((0) << 12) | ((31)*32 + (10));
    }

    if (!player.slammable) {
        shadowOAM[20].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[20].attr1 = 41 | (0 << 14);
     shadowOAM[20].attr2 = ((0) << 12) | ((30)*32 + (0));
    } else {
        shadowOAM[20].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[20].attr1 = 41 | (0 << 14);
     shadowOAM[20].attr2 = ((0) << 12) | ((31)*32 + (10));
    }

    if (!player.healable) {
        shadowOAM[21].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[21].attr1 = 54 | (0 << 14);
     shadowOAM[21].attr2 = ((0) << 12) | ((30)*32 + (0));
    } else {
        shadowOAM[21].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[21].attr1 = 54 | (0 << 14);
     shadowOAM[21].attr2 = ((0) << 12) | ((31)*32 + (10));
    }

    if (!player.shieldable) {
        shadowOAM[22].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[22].attr1 = 67 | (0 << 14);
     shadowOAM[22].attr2 = ((0) << 12) | ((30)*32 + (0));
    } else {
        shadowOAM[22].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[22].attr1 = 67 | (0 << 14);
     shadowOAM[22].attr2 = ((0) << 12) | ((31)*32 + (10));
    }

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);

}

void initBlockers() {
    blockers[0].active = 1;
    blockers[0].width = 32;
    blockers[0].height = 80;
    blockers[0].worldCol = 96;
    blockers[0].worldRow = 176;

    blockers[1].active = 1;
    blockers[1].width = 80;
    blockers[1].height = 33;
    blockers[1].worldCol = 240;
    blockers[1].worldRow = 96;

    blockers[2].active = 1;
    blockers[2].width = 32;
    blockers[2].height = 80;
    blockers[2].worldCol = 480;
    blockers[2].worldRow = 8;

    blockers[3].active = 1;
    blockers[3].width = 32;
    blockers[3].height = 256;
    blockers[3].worldCol = 768;
    blockers[3].worldRow = 0;
}

void initPlayer() {
    player.width = 32;
    player.height = 32;
    player.rdel = 1;
    player.cdel = 1;
    player.worldRow = 32;
    player.worldCol = 32;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = PLAYERRIGHT;
    player.health = 20;

    player.attacking = 0;

    player.meleeable = 1;
    player.meleeDamage = 2;
    player.meleeCounter = 0;
    player.meleeing = 0;

    player.fireballable = 1;
    player.fireballDamage = 1;
    player.fireballCounter = 0;
    player.fireballing = 0;

    player.dashable = 1;
    player.dashCDcounter = 0;
    player.dashDamage = 1;
    player.dashCD = 3;
    player.dashing = 0;
    player.dashCDstarts = 0;
    player.dashingCounter = 0;

    player.slammable = 1;
    player.slamCDcounter = 0;;
    player.slamDamage = 3;
    player.slamCD = 300;
    player.slamming = 0;
    player.slamCDstarts = 0;
    player.slammingCounter = 0;

    player.swingable = 1;
    player.swingCDcounter = 0;
    player.swingDamage = 1;
    player.swingCD = 300;
    player.swinging = 0;
    player.swingCDstarts = 0;
    player.swingingCounter = 0;

    player.wavable = 1;
    player.waveDamage = 2;
    player.wavingCounter = 0;
    player.waving = 0;

    player.shieldDuration = 300;
    player.shieldable = 1;
    player.shieldCounter = 0;
    player.shieldHide = 1;
    player.shielding = 0;

    player.healable = 1;
    player.healCD = 500;
    player.healCDcounter = 0;
    player.healAmount = 3;
    player.healHide = 1;
    player.healCDstarts = 0;
    player.healing = 0;
    player.healingCounter = 0;
}

void initEnemy0() {
    enemy0.width = 32;
    enemy0.height = 32;
    enemy0.rdel = 1;
    enemy0.cdel = 1;
    enemy0.moveCounter = 0;
    enemy0.worldRow = -enemy0.height;
    enemy0.worldCol = 0;
    enemy0.health = 60;
    enemy0.hide = 1;

    enemy0.aniCounter = 0;
    enemy0.curFrame = 0;
    enemy0.numFrames = 3;
    enemy0.aniState = BOSSRIGHT;

    enemy0.meleeable = 1;
    enemy0.meleeDamage = 1;
    enemy0.meleeCDcounter = 0;
    enemy0.meleeCD = 90;

    enemy0.explodable = 1;
    enemy0.explodeCDcounter = 0;
    enemy0.explodeDamage = 1;
    enemy0.explodeCD = 400;
    enemy0.explodeMode = 0;

}

void initMinor1s() {
 for (int i = 0; i < 3; i++) {
        minor1s[i].height = 32;
  minor1s[i].width = 32;
  minor1s[i].worldRow = -minor1s[i].height;
   minor1s[i].worldCol = 0;
  minor1s[i].cdel = 1;
        minor1s[i].rdel = 1;
   minor1s[i].hide = 1;
        minor1s[i].health = 20;
        minor1s[i].moveCounter = 0;

        minor1s[i].aniCounter = 0;
        minor1s[i].curFrame = 0;
        minor1s[i].numFrames = 3;
        minor1s[i].aniState = BOSSRIGHT;

        minor1s[i].meleeable = 1;
        minor1s[i].meleeDamage = 1;
        minor1s[i].meleeCDcounter = 0;
        minor1s[i].meleeCD = 120;
 }
    minor1s[0].worldRow = 192;
    minor1s[0].worldCol = 32;
    minor1s[0].hide = 0;
}

void initFireballs() {
 for (int i = 0; i < 5; i++) {
        fireballs[i].height = 8;
  fireballs[i].width = 8;
  fireballs[i].worldRow = -fireballs[i].height;
   fireballs[i].worldCol = 0;
  fireballs[i].cdel = 3;
   fireballs[i].hide = 1;
        fireballs[i].left = 0;
        fireballs[i].right = 0;
 }
}

void initEyeballs() {
 for (int i = 0; i < 4; i++) {
        eyeballs[i].height = 8;
  eyeballs[i].width = 8;
  eyeballs[i].worldRow = -eyeballs[i].height;
   eyeballs[i].worldCol = 0;
  eyeballs[i].cdel = 2;
        eyeballs[i].rdel = 2;
   eyeballs[i].hide = 1;
        eyeballs[i].left = 0;
        eyeballs[i].right = 0;
        eyeballs[i].up = 0;
        eyeballs[i].down = 0;
 }
}

void initWave() {
    wave.height = 16;
 wave.width = 16;
 wave.worldRow = -wave.height;
  wave.worldCol = 0;
 wave.cdel = 2;
  wave.hide = 1;
    wave.left = 0;
    wave.right = 0;
}

void updatePlayer() {
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6)))
    && collisionCheck(collisionMap, 1024, player.worldCol, player.worldRow, player.width, player.height, 0, - player.rdel) &&
    (!collision(blockers[1].worldCol, blockers[1].worldRow, blockers[1].width, blockers[1].height,
        player.worldCol, player.worldRow - player.rdel, player.width, player.height) | !blockers[1].active)) {
        if ((player.worldRow - player.rdel >= 0) ) {
            player.worldRow -= player.rdel;
        }

        if ((160 / 2 >= player.worldRow - vOff) && (vOff > 0)) {
            vOff -= player.rdel;
        }
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))) {
        if ((player.worldRow + player.height + player.rdel <= 256) &&
        collisionCheck(collisionMap, 1024, player.worldCol, player.worldRow, player.width, player.height, 0, player.rdel)){
            player.worldRow += player.rdel;
        }

        if ((160 / 2 <= player.worldRow - vOff) && (vOff + 160 < 256)) {
            vOff += player.rdel;
        }
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        if ((player.worldCol - player.cdel >= hOfflimit) &&
        collisionCheck(collisionMap, 1024, player.worldCol, player.worldRow, player.width, player.height, -player.cdel, 0)
        ) {
            player.worldCol -= player.cdel;
        }

        if ((240 / 2 >= (player.worldCol + player.width - (hOff + hOfflimit))) && (hOff > 0)) {
            hOff -= player.cdel;
        }
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        if ((player.worldCol + player.width + player.cdel <= 1024) &&
        collisionCheck(collisionMap, 1024, player.worldCol, player.worldRow, player.width, player.height, player.cdel, 0) &&
        (!collision(blockers[0].worldCol, blockers[0].worldRow, blockers[0].width, blockers[0].height,
        player.worldCol + player.cdel, player.worldRow, player.width, player.height) | !blockers[0].active) &&
        (!collision(blockers[2].worldCol, blockers[2].worldRow, blockers[2].width, blockers[2].height,
        player.worldCol + player.cdel, player.worldRow, player.width, player.height) | !blockers[2].active) &&
        (!collision(blockers[3].worldCol, blockers[3].worldRow, blockers[3].width, blockers[3].height,
        player.worldCol + player.cdel, player.worldRow, player.width, player.height) | !blockers[3].active)
        ) {
            player.worldCol += player.cdel;
        }

        if ((240 / 2 <= player.worldCol - (hOff + hOfflimit)) && (hOff + 240 < 512)) {
            hOff += player.cdel;
        }
    }


    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 8)))) {
        if (player.shieldable) {
            player.shielding = 1;
            player.shieldHide = 0;
            player.shieldCounter += 2;
        }
    } else if (player.shieldCounter >= 0) {
        player.shielding = 0;
        player.shieldHide = 1;
        player.shieldCounter--;
        if (player.shieldCounter == 0) {
            player.shieldable = 1;
        }
    }

    if(player.shieldCounter >= player.shieldDuration) {
        player.shieldable = 0;
        player.shielding = 0;
        player.shieldHide = 1;
    }


    if ((!(~(oldButtons) & ((1 << 9))) && (~buttons & ((1 << 9)))) && player.healable) {
        player.healingCounter = 0;
        player.healing = 1;
        player.healHide = 0;
        player.healable = 0;
        player.healCDstarts = 1;
    }

    if (player.healing) {
        player.healingCounter++;
    }

    if (player.healingCounter >= 60) {
        player.healingCounter = 0;
        player.healing = 0;
        player.healHide = 1;
        for (int i = 0; i < player.healAmount; i++) {
            if (player.health < 20) {
                player.health++;
            }
        }
    }

    if (player.healCDstarts) {
        player.healCDcounter++;
    }

    if (player.healCDcounter >= player.healCD) {
        player.healCDcounter = 0;
        player.healable = 1;
        player.healCDstarts = 0;
    }



    if (((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5))) ^ (~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) && (!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))) &&
    player.dashable && !player.swinging && !player.slamming && !player.meleeing && !player.fireballing
    && !player.waving) {
        playSoundB(dashSound_data, dashSound_length, 0);
        player.dashingCounter = 0;
        player.cdel = 5;
        player.rdel = 0;
        player.attacking = 1;
        player.dashing = 1;
        player.dashCDstarts = 1;
    }

    if (player.dashing) {
        player.dashable = 0;
        player.dashingCounter++;
        if (collision(player.worldCol, player.worldRow, player.width, player.height, enemy0.worldCol, enemy0.worldRow, enemy0.width, enemy0.height)) {
            enemy0.dashed = 1;
        }
        for (int i = 0; i < 3; i++) {
            if (collision(player.worldCol, player.worldRow, player.width, player.height,
            minor1s[i].worldCol, minor1s[i].worldRow, minor1s[i].width, minor1s[i].height)) {
                minor1s[i].dashed = 1;
            }
        }
    }

    if (player.dashingCounter >= 20) {
        player.dashingCounter = 0;
        player.attacking = 0;
        player.dashing = 0;
        player.cdel = 1;
        player.rdel = 1;
        if (enemy0.dashed) {
            enemy0.health -= player.dashDamage;
            enemy0.dashed = 0;
        }
        for (int i = 0; i < 3; i++) {
            if (minor1s[i].dashed) {
                minor1s[i].health -= player.dashDamage;
                minor1s[i].dashed = 0;
            }
        }
    }

    if (player.dashCDstarts) {
        *(volatile unsigned short*)0x400010A = 0;
        *(volatile unsigned short*)0x4000108 = (65536 - 16384);
        *(volatile unsigned short*)0x400010A = 3 | (1<<7) | (1<<6);

        shadowOAM[17].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[17].attr1 = 2 | (0 << 14);
     shadowOAM[17].attr2 = ((0) << 12) | ((31)*32 + (player.dashCD - player.dashCDcounter));

        player.dashCDstarts = 0;
    }

    if (player.dashCDcounter >= player.dashCD) {
        *(volatile unsigned short*)0x400010A = (0<<7);
        player.dashCDcounter = 0;
        player.dashable = 1;
        player.dashCDstarts = 0;
        shadowOAM[17].attr0 = 149 | (0 << 13) | (0 << 14);
     shadowOAM[17].attr1 = 2 | (0 << 14);
     shadowOAM[17].attr2 = ((0) << 12) | ((31)*32 + (10));
    }



    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))) && (!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))) && player.swingable && !player.dashing
    && !player.slamming && !player.meleeing && !player.fireballing && !player.waving) {
        playSoundB(swingSound_data, swingSound_length, 0);
        player.swingingCounter = 0;
        player.cdel = 0;
        player.rdel = 0;
        player.attacking = 1;
        player.swinging = 1;
        player.swingCDstarts = 1;
    }

    if (player.swinging) {
        player.swingable = 0;
        player.swingingCounter++;
        if (player.swingingCounter % 10 == 0) {
            if (collision(player.worldCol - 8, player.worldRow - 8 , player.width + 16, player.height + 16, enemy0.worldCol, enemy0.worldRow, enemy0.width, enemy0.height)) {
                enemy0.health -= player.swingDamage;
            }
            for (int i = 0; i < 3; i++) {
                if (collision(player.worldCol - 8, player.worldRow - 8 , player.width + 16, player.height + 16,
                minor1s[i].worldCol, minor1s[i].worldRow, minor1s[i].width, minor1s[i].height)) {
                    minor1s[i].health -= player.swingDamage;
                }
            }
        }
    }

    if (player.swingingCounter >= 40) {
        player.swingingCounter = 0;
        player.attacking = 0;
        player.swinging = 0;
        player.cdel = 1;
        player.rdel = 1;
    }

    if (player.swingCDstarts) {
        player.swingCDcounter++;
    }

    if (player.swingCDcounter >= player.swingCD) {
        player.swingCDcounter = 0;
        player.swingable = 1;
        player.swingCDstarts = 0;
    }



    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))) && (!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))) && player.slammable && !player.dashing
    && !player.swinging && !player.meleeing && !player.fireballing && !player.waving) {
        playSoundB(slamSound_data, slamSound_length, 0);
        player.slammingCounter = 0;
        player.cdel = 0;
        player.rdel = 0;
        player.attacking = 1;
        player.slamming = 1;
        player.slamCDstarts = 1;
    }

    if (player.slamming) {
        player.slammable = 0;
        player.slammingCounter++;
        if (collision(player.worldCol - 8, player.worldRow - 8 , player.width + 16, player.height + 16,
        enemy0.worldCol, enemy0.worldRow, enemy0.width, enemy0.height)) {
            enemy0.slammed = 1;
        }
        for (int i = 0; i < 3; i++) {
            if (collision(player.worldCol - 8, player.worldRow - 8 , player.width + 16, player.height + 16,
            minor1s[i].worldCol, minor1s[i].worldRow, minor1s[i].width, minor1s[i].height)) {
                minor1s[i].slammed = 1;
            }
        }
    }

    if (player.slammingCounter >= 40) {
        player.slammingCounter = 0;
        player.attacking = 0;
        player.slamming = 0;
        player.cdel = 1;
        player.rdel = 1;
        if (enemy0.slammed) {
            enemy0.health -= player.slamDamage;
            enemy0.slammed = 0;
        }
        for (int i = 0; i < 3; i++) {
            if (minor1s[i].slammed) {
                minor1s[i].health -= player.slamDamage;
                minor1s[i].slammed = 0;
            }
        }
    }

    if (player.slamCDstarts) {
        player.slamCDcounter++;
    }

    if (player.slamCDcounter >= player.slamCD) {
        player.slamCDcounter = 0;
        player.slammable = 1;
        player.slamCDstarts = 0;
    }



    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))) && !player.swinging && !player.slamming && !player.dashing && !player.fireballing
    && !player.waving && player.meleeable) {
        playSoundB(meleeSound_data, meleeSound_length, 0);
        player.meleeCounter = 0;
        player.attacking = 1;
        player.meleeing = 1;
    }

    if (player.meleeing) {
        player.meleeable = 0;
        player.meleeCounter++;
    }

    if (player.meleeCounter >= 30) {
        player.meleeCounter = 0;
        player.attacking = 0;
        player.meleeing = 0;
        if (enemy0.meleed) {
            enemy0.health -= player.meleeDamage;
            enemy0.meleed = 0;
        }
        for (int i = 0; i < 3; i++) {
            if (minor1s[i].meleed) {
                minor1s[i].health -= player.meleeDamage;
                minor1s[i].meleed = 0;
            }
        }
        player.meleeable = 1;
    }



    if (((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5))) ^ (~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) && (!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1)))) &&
    player.wavable && !player.swinging && !player.slamming && !player.meleeing && !player.fireballing
    && !player.dashing) {
        playSoundB(waveSound_data, waveSound_length, 0);
        player.wavingCounter = 0;
        player.attacking = 1;
        player.waving = 1;
        if (player.aniState == PLAYERLEFT) {
            wave.worldCol = player.worldCol - wave.width;
            wave.worldRow = player.worldRow + 8;
            wave.left = 1;
        } else if (player.aniState == PLAYERRIGHT) {
            wave.worldCol = player.worldCol + player.width - 1;
            wave.worldRow = player.worldRow + 8;
            wave.right = 1;
        }
    }

    if (player.waving) {
        player.wavable = 0;
        player.wavingCounter++;
    }

    if (player.wavingCounter >= 15) {
  wave.hide = 0;
        player.wavingCounter = 0;
        player.attacking = 0;
        player.waving = 0;
    }


    if ((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1)))) && !player.swinging && !player.slamming && !player.dashing && !player.meleeing
    && !player.waving && player.fireballable) {
        playSoundB(fireballSound_data, fireballSound_length, 0);
        player.attacking = 1;
        player.fireballing = 1;
        player.fireballable = 0;
        for (int i = 0; i < 5; i++) {
      if (fireballs[i].hide) {
       if (player.aniState == PLAYERLEFT) {
                    fireballs[i].worldCol = player.worldCol - fireballs[i].width;
                    fireballs[i].worldRow = player.worldRow + 8;
                    fireballs[i].left = 1;
                } else if (player.aniState == PLAYERRIGHT) {
                    fireballs[i].worldCol = player.worldCol + player.width - 1;
                    fireballs[i].worldRow = player.worldRow + 8;
                    fireballs[i].right = 1;
                }
       fireballs[i].hide = 0;
       break;
      }
     }
    }

    if (player.fireballing) {
        player.fireballCounter++;
    }

    if (player.fireballCounter >= 30) {
        player.fireballCounter = 0;
        player.attacking = 0;
        player.fireballing = 0;
        player.fireballable = 1;
    }


    for (int i = 0; i < 4; i++) {
  if (!eyeballs[i].hide && collision(player.worldCol, player.worldRow, player.width, player.height,
   eyeballs[i].worldCol, eyeballs[i].worldRow, eyeballs[i].width, eyeballs[i].height)) {
   eyeballs[i].hide = 1;
            eyeballs[i].left = 0;
            eyeballs[i].right = 0;
            eyeballs[i].up = 0;
            eyeballs[i].down = 0;
   eyeballs[i].worldRow = -eyeballs[i].height;
       eyeballs[i].worldCol = 0;
            if (!player.shielding) {
       player.health -= enemy0.explodeDamage;
            }
  }
 }

    animatePlayer();
}

void animatePlayer() {

    if (!player.meleeing) {
        player.prevAniState = player.aniState;
        player.aniState = PLAYERIDLE;

        if(player.aniCounter % 15 == 0) {
            player.curFrame = (player.curFrame + 1) % player.numFrames;
        }


        if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
            player.aniState = PLAYERLEFT;
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
            player.aniState = PLAYERRIGHT;
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6)))) {
            if (player.prevAniState == PLAYERRIGHTATTACK) {
                player.aniState = PLAYERRIGHT;
            } else if (player.prevAniState == PLAYERLEFTATTACK) {
                player.aniState = PLAYERLEFT;
            } else {
                player.aniState = player.prevAniState;
            }
        } else if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))) {
            if (player.prevAniState == PLAYERRIGHTATTACK) {
                player.aniState = PLAYERRIGHT;
            } else if (player.prevAniState == PLAYERLEFTATTACK) {
                player.aniState = PLAYERLEFT;
            } else {
                player.aniState = player.prevAniState;
            }
        }
        if (player.aniState == PLAYERIDLE) {
            player.curFrame = 0;
            player.aniCounter = 0;
            if (player.prevAniState == PLAYERRIGHTATTACK) {
                player.aniState = PLAYERRIGHT;
            } else if (player.prevAniState == PLAYERLEFTATTACK) {
                player.aniState = PLAYERLEFT;
            } else {
                player.aniState = player.prevAniState;
            }
        } else {
            player.aniCounter++;
        }
    } else {
        player.prevAniState = player.aniState;

        if (player.prevAniState == PLAYERRIGHT) {
            player.aniState = PLAYERRIGHTATTACK;
        } else if (player.prevAniState == PLAYERLEFT) {
            player.aniState = PLAYERLEFTATTACK;
        }


        if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5))))
            player.aniState = PLAYERLEFTATTACK;
        if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4))))
            player.aniState = PLAYERRIGHTATTACK;

        if (player.aniState == PLAYERRIGHTATTACK) {
            if (collision(player.worldCol, player.worldRow, player.width + 8, player.height,
            enemy0.worldCol, enemy0.worldRow, enemy0.width, enemy0.height)) {
                enemy0.meleed = 1;
            }
            for (int i = 0; i < 3; i++) {
                if (collision(player.worldCol, player.worldRow, player.width + 8, player.height,
                minor1s[i].worldCol, minor1s[i].worldRow, minor1s[i].width, minor1s[i].height)) {
                    minor1s[i].meleed = 1;
                }
            }
        } else if (player.aniState == PLAYERLEFTATTACK) {
            if (collision(player.worldCol - 8, player.worldRow, player.width + 8, player.height,
            enemy0.worldCol, enemy0.worldRow, enemy0.width, enemy0.height)) {
                enemy0.meleed = 1;
            }
            for (int i = 0; i < 3; i++) {
                if (collision(player.worldCol - 8, player.worldRow, player.width + 8, player.height,
                minor1s[i].worldCol, minor1s[i].worldRow, minor1s[i].width, minor1s[i].height)) {
                    minor1s[i].meleed = 1;
                }
            }
        }
    }
}

void updateEnemy0(){
    if (!enemy0.hide) {
        if (enemy0.explodable && !enemy0.meleeing) {
            enemy0.explodingCounter = 0;
            enemy0.cdel = 0;
            enemy0.rdel = 0;
            enemy0.exploding = 1;
            enemy0.explodeCDstarts = 1;
        }

        if (enemy0.exploding) {
            enemy0.explodable = 0;
            enemy0.explodingCounter++;

        }

        if (enemy0.explodingCounter >= 60) {
            enemy0.explodingCounter = 0;
            enemy0.exploding = 0;
            for (int i = 0; i < 4; i++) {
                eyeballs[i].worldCol = enemy0.worldCol + 8;
                eyeballs[i].worldRow = enemy0.worldRow + 8;
       eyeballs[i].hide = 0;
         }
            if (enemy0.explodeMode == 0) {
                eyeballs[0].left = 1;
                eyeballs[1].right = 1;
                eyeballs[2].up = 1;
                eyeballs[3].down = 1;
            } else {
                eyeballs[0].left = 1;
                eyeballs[0].up = 1;

                eyeballs[1].right = 1;
                eyeballs[1].up = 1;

                eyeballs[2].left = 1;
                eyeballs[2].down = 1;

                eyeballs[3].right = 1;
                eyeballs[3].down = 1;
            }

            enemy0.cdel = 1;
            enemy0.rdel = 1;
            enemy0.explodeMode = (enemy0.explodeMode + 1) % 2;

        }

        if (enemy0.explodeCDstarts) {
            enemy0.explodeCDcounter++;
        }

        if (enemy0.explodeCDcounter >= enemy0.explodeCD) {
            enemy0.explodeCDcounter = 0;
            enemy0.explodable = 1;
            enemy0.explodeCDstarts = 0;
        }



        if (enemy0.moveCounter % 3 == 0) {
            if(enemy0.worldRow > player.worldRow) {
                if ((enemy0.worldRow - enemy0.rdel >= 0)
                && collisionCheck(collisionMap, 1024, enemy0.worldCol, enemy0.worldRow,
                enemy0.width, enemy0.height, 0, - enemy0.rdel)) {
                    enemy0.worldRow -= enemy0.rdel;
                }
            } else if (enemy0.worldRow < player.worldRow) {
                if ((enemy0.worldRow + enemy0.height + enemy0.rdel <= 256) &&
                collisionCheck(collisionMap, 1024, enemy0.worldCol,
                enemy0.worldRow, enemy0.width, enemy0.height, 0, enemy0.rdel)){
                    enemy0.worldRow += enemy0.rdel;
                }
            }
            if(enemy0.worldCol > player.worldCol) {
                if ((enemy0.worldCol - enemy0.cdel >= hOfflimit) &&
                collisionCheck(collisionMap, 1024, enemy0.worldCol,
                enemy0.worldRow, enemy0.width, enemy0.height, -enemy0.cdel, 0)) {
                    enemy0.worldCol -= enemy0.cdel;
                    enemy0.aniState = BOSSLEFT;
                }
            } else if(enemy0.worldCol < player.worldCol) {
                if ((enemy0.worldCol + enemy0.width + enemy0.cdel <= 512 + hOfflimit) &&
                collisionCheck(collisionMap, 1024, enemy0.worldCol,
                enemy0.worldRow, enemy0.width, enemy0.height, enemy0.cdel, 0)) {
                    enemy0.worldCol += enemy0.cdel;
                    enemy0.aniState = BOSSRIGHT;
                }
            }
            enemy0.moveCounter = 0;
        }
        enemy0.moveCounter++;


        if (!enemy0.hide && collision(enemy0.worldCol, enemy0.worldRow, enemy0.width, enemy0.height,
   player.worldCol, player.worldRow, player.width, player.height) && enemy0.meleeable) {
            enemy0.meleeCounter = 0;
            enemy0.meleeing = 1;
            enemy0.meleeCDstarts = 1;
        }

        if (enemy0.meleeing) {
            enemy0.meleeable = 0;
            enemy0.meleeCounter++;
        }

        if (enemy0.meleeCounter >= 30) {
            enemy0.meleeCounter = 0;
            enemy0.meleeing = 0;
            if (!enemy0.hide && collision(enemy0.worldCol, enemy0.worldRow, enemy0.width, enemy0.height,
       player.worldCol, player.worldRow, player.width, player.height) && !player.shielding) {
                player.health -= enemy0.meleeDamage;
            }
            enemy0.aniCounter = 0;
        }

        if (enemy0.meleeCDstarts) {
            enemy0.meleeCDcounter++;
        }

        if (enemy0.meleeCDcounter >= enemy0.meleeCD) {
            enemy0.meleeCDcounter = 0;
            enemy0.meleeable = 1;
            enemy0.meleeCDstarts = 0;
        }




        for (int i = 0; i < 5; i++) {
      if (!fireballs[i].hide && collision(enemy0.worldCol, enemy0.worldRow, enemy0.width, enemy0.height,
       fireballs[i].worldCol, fireballs[i].worldRow, fireballs[i].width, fireballs[i].height)) {
       fireballs[i].hide = 1;
                fireballs[i].left = 0;
                fireballs[i].right = 0;
       fireballs[i].worldRow = -fireballs[i].height;
           fireballs[i].worldCol = 0;;
       enemy0.health -= player.fireballDamage;
      }
     }
        if (!wave.hide && collision(enemy0.worldCol, enemy0.worldRow, enemy0.width, enemy0.height,
   wave.worldCol, wave.worldRow, wave.width, wave.height)) {
   enemy0.waved = 1;
     }

        enemy0.prevAniState = enemy0.aniState;

        if(enemy0.aniCounter % 15 == 0) {
            enemy0.curFrame = (enemy0.curFrame + 1) % enemy0.numFrames;
        }
        enemy0.aniCounter++;
    }
}

void updateMinor1(MINOR1* m) {
    if (!m->hide) {
        if (m->moveCounter % 3 == 0) {
            if(m->worldRow > player.worldRow) {
                if ((m->worldRow - m->rdel >= 0)
                && collisionCheck(collisionMap, 1024, m->worldCol, m->worldRow,
                m->width, m->height, 0, - m->rdel) && (!collision(blockers[1].worldCol, blockers[1].worldRow, blockers[1].width, blockers[1].height,
        m->worldCol, m->worldRow - m->rdel, m->width, m->height) | !blockers[1].active)) {
                    m->worldRow -= m->rdel;
                }
            } else if (m->worldRow < player.worldRow) {
                if ((m->worldRow + m->height + m->rdel <= 256) &&
                collisionCheck(collisionMap, 1024, m->worldCol,
                m->worldRow, m->width, m->height, 0, m->rdel)){
                    m->worldRow += m->rdel;
                }
            }
            if(m->worldCol > player.worldCol) {
                if ((m->worldCol - m->cdel >= hOfflimit) &&
                collisionCheck(collisionMap, 1024, m->worldCol,
                m->worldRow, m->width, m->height, -m->cdel, 0) ) {
                    m->worldCol -= m->cdel;
                    m->aniState = BOSSLEFT;
                }
            } else if(m->worldCol < player.worldCol) {
                if ((m->worldCol + m->width + m->cdel <= 512 + hOfflimit) &&
                collisionCheck(collisionMap, 1024, m->worldCol,
                m->worldRow, m->width, m->height, m->cdel, 0) &&
                (!collision(blockers[0].worldCol, blockers[0].worldRow, blockers[0].width, blockers[0].height,
                m->worldCol + m->cdel, m->worldRow, m->width, m->height) | !blockers[0].active) &&
                (!collision(blockers[2].worldCol, blockers[2].worldRow, blockers[2].width, blockers[2].height,
                m->worldCol + m->cdel, m->worldRow, m->width, m->height) | !blockers[2].active) &&
                (!collision(blockers[3].worldCol, blockers[3].worldRow, blockers[3].width, blockers[3].height,
                m->worldCol + m->cdel, m->worldRow, m->width, m->height) | !blockers[3].active)
                ) {
                    m->worldCol += m->cdel;
                    m->aniState = BOSSRIGHT;
                }
            }
            m->moveCounter = 0;
        }
        m->moveCounter++;

        if (!m->hide && collision(m->worldCol, m->worldRow, m->width, m->height,
   player.worldCol, player.worldRow, player.width, player.height) && m->meleeable) {
            m->meleeCounter = 0;
            m->meleeing = 1;
            m->meleeCDstarts = 1;
        }

        if (m->meleeing) {
            m->meleeable = 0;
            m->meleeCounter++;
        }

        if (m->meleeCounter >= 20) {
            m->meleeCounter = 0;
            m->meleeing = 0;
            if (!m->hide && collision(m->worldCol, m->worldRow, m->width, m->height,
       player.worldCol, player.worldRow, player.width, player.height) && !player.shielding) {
                player.health -= m->meleeDamage;
            }
            m->aniCounter = 0;
        }

        if (m->meleeCDstarts) {
            m->meleeCDcounter++;
        }

        if (m->meleeCDcounter >= m->meleeCD) {
            m->meleeCDcounter = 0;
            m->meleeable = 1;
            m->meleeCDstarts = 0;
        }




        for (int i = 0; i < 5; i++) {
      if (!fireballs[i].hide && collision(m->worldCol, m->worldRow, m->width, m->height,
       fireballs[i].worldCol, fireballs[i].worldRow, fireballs[i].width, fireballs[i].height)) {
       fireballs[i].hide = 1;
                fireballs[i].left = 0;
                fireballs[i].right = 0;
       fireballs[i].worldRow = -fireballs[i].height;
           fireballs[i].worldCol = 0;;
       m->health -= player.fireballDamage;
      }
     }
        if (!wave.hide && collision(m->worldCol, m->worldRow, m->width, m->height,
   wave.worldCol, wave.worldRow, wave.width, wave.height)) {
   m->waved = 1;
     }

        m->prevAniState = m->aniState;

        if(m->aniCounter % 15 == 0) {
            m->curFrame = (m->curFrame + 1) % m->numFrames;
        }
        m->aniCounter++;

        if(m->health <= 0) {
            m->worldRow = -m->height;
       m->worldCol = 0;
       m->hide = 1;
            m->health = 20;
            m->moveCounter = 0;

            m->aniCounter = 0;
            m->curFrame = 0;
            m->aniState = BOSSRIGHT;

            m->meleeable = 1;
            m->meleeCDcounter = 0;

            enemykilled++;
        }

    }
}

void updateFireball(FIREBALL* f){
    if (!f->hide) {
  if (f->left) {
            f->worldCol -= f->cdel;
        } else if (f->right) {
            f->worldCol += f->cdel;
        }
 }
 if ((!f->hide) && ((f->worldCol - f->cdel <= hOfflimit) | (f->worldCol + f->width +
        f->cdel >= 512 + hOfflimit) | (collisionMap[((f->worldRow) * (1024) + (f->worldCol + f->width))] == 0) |
        (collisionMap[((f->worldRow + f->height - 1) * (1024) + (f->worldCol + f->width))] == 0) |
        (collision(blockers[0].worldCol, blockers[0].worldRow, blockers[0].width, blockers[0].height,
        f->worldCol, f->worldRow, f->width, f->height) && blockers[0].active) |
        (collision(blockers[2].worldCol, blockers[2].worldRow, blockers[2].width, blockers[2].height,
        f->worldCol, f->worldRow, f->width, f->height) && blockers[2].active) |
        (collision(blockers[3].worldCol, blockers[3].worldRow, blockers[3].width, blockers[3].height,
        f->worldCol, f->worldRow, f->width, f->height) && blockers[3].active))) {

  f->hide = 1;
        f->left = 0;
        f->right = 0;
 }
}

void updateEyeball(FIREBALL* f){
    if (!f->hide) {
  if (f->left) {
            f->worldCol -= f->cdel;
        } else if (f->right) {
            f->worldCol += f->cdel;
        }
        if (f->up) {
            f->worldRow -= f->rdel;
        } else if (f->down) {
            f->worldRow += f->rdel;
        }
 }
 if ((f->worldCol - f->cdel <= hOfflimit) | (f->worldCol + f->width + f->cdel >= 512 + hOfflimit) |
    (f->worldRow - f->rdel <= 0) | (f->worldRow + f->height + f->rdel >= 256)) {
  f->hide = 1;
        f->left = 0;
        f->right = 0;
        f->up = 0;
        f->down = 0;
 }
}

void updateWave(){
    if (!wave.hide) {
  if (wave.left) {
            wave.worldCol -= wave.cdel;
        } else if (wave.right) {
            wave.worldCol += wave.cdel;
        }
 }
 if ((wave.worldCol - wave.cdel <= hOfflimit) | (wave.worldCol + wave.width + wave.cdel >= 512 + hOfflimit)) {
  wave.hide = 1;
        wave.left = 0;
        wave.right = 0;
        if(enemy0.waved) {
            enemy0.health -= player.waveDamage;
            enemy0.waved = 0;
        }
        for (int i = 0; i < 3; i++) {
            if(minor1s[i].waved) {
                minor1s[i].health -= player.waveDamage;
                minor1s[i].waved = 0;
            }
        }
        player.wavable = 1;
 }
}

void drawPlayer() {

    drawDigits0(73, 9, player.health, 13);
    if (player.hide) {
        shadowOAM[2].attr0 |= (2 << 8);
    } else if (!player.attacking){
        shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
        shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
        shadowOAM[2].attr2 = ((swordPalr) << 12) | ((player.curFrame * 4)*32 + (player.aniState * 4));
    } else if (player.meleeing && !player.dashing && !player.swinging && !player.fireballing && !player.slamming
    && !player.waving) {
        if (player.aniState == PLAYERRIGHTATTACK) {
            if (player.meleeCounter <= 10) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((swordPalr) << 12) | ((4)*32 + (8));
            } else if (player.meleeCounter <= 20) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((swordPalr) << 12) | ((8)*32 + (8));
            } else if (player.meleeCounter <= 30) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((swordPalr) << 12) | ((0)*32 + (8));
            }
        } else if (player.aniState == PLAYERLEFTATTACK) {
            if (player.meleeCounter <= 10) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((swordPalr) << 12) | ((4)*32 + (12));
            } else if (player.meleeCounter <= 20) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((swordPalr) << 12) | ((8)*32 + (12));
            } else if (player.meleeCounter <= 30) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((swordPalr) << 12) | ((0)*32 + (12));
            }
        }
    } else if (player.dashing && !player.swinging && !player.slamming && !player.meleeing && !player.fireballing
    && !player.waving) {
        if (player.aniState == PLAYERRIGHT) {
            shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[2].attr2 = ((swordPalr) << 12) | ((0)*32 + (28));

        } else if (player.aniState == PLAYERLEFT) {
            shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[2].attr2 = ((swordPalr) << 12) | ((0)*32 + (24));

        }
    } else if (player.swinging && !player.dashing && !player.slamming && !player.meleeing && !player.fireballing
    && !player.waving) {
        if (player.swingingCounter <= 10) {
            shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[2].attr2 = ((swordPalr) << 12) | ((0)*32 + (16));
        } else if (player.swingingCounter <= 20) {
            shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[2].attr2 = ((swordPalr) << 12) | ((4)*32 + (16));
        } else if (player.swingingCounter <= 30) {
            shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[2].attr2 = ((swordPalr) << 12) | ((8)*32 + (16));
        } else if (player.swingingCounter <= 40) {
            shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[2].attr2 = ((swordPalr) << 12) | ((12)*32 + (16));
        }
    } else if (player.slamming && !player.dashing && !player.swinging && !player.meleeing && !player.fireballing
    && !player.waving) {
        if (player.slammingCounter <= 10) {
            shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[2].attr2 = ((firePalr) << 12) | ((0)*32 + (20));
        } else if (player.slammingCounter <= 20) {
            shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[2].attr2 = ((firePalr) << 12) | ((4)*32 + (20));
        } else if (player.slammingCounter <= 40) {
            shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[2].attr2 = ((firePalr) << 12) | ((8)*32 + (20));
        }
    } else if (player.fireballing && !player.swinging && !player.slamming && !player.meleeing && !player.dashing
    && !player.waving) {
        if (player.aniState == PLAYERRIGHT) {
            shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[2].attr2 = ((firePalr) << 12) | ((4)*32 + (28));

        } else if (player.aniState == PLAYERLEFT) {
            shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[2].attr2 = ((firePalr) << 12) | ((4)*32 + (24));
        }
    } else if (player.waving && !player.swinging && !player.slamming && !player.meleeing && !player.dashing
    && !player.fireballing) {
        if (player.aniState == PLAYERRIGHT) {
            if (player.wavingCounter <= 5) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((wavePalr) << 12) | ((8)*32 + (28));
            } else if (player.wavingCounter <= 10) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((wavePalr) << 12) | ((12)*32 + (28));
            } else if (player.wavingCounter <= 15) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((wavePalr) << 12) | ((16)*32 + (28));
            }
        } else if (player.aniState == PLAYERLEFT) {
            if (player.wavingCounter <= 5) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((wavePalr) << 12) | ((8)*32 + (24));
            } else if (player.wavingCounter <= 10) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((wavePalr) << 12) | ((12)*32 + (24));
            } else if (player.wavingCounter <= 15) {
                shadowOAM[2].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
                shadowOAM[2].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
                shadowOAM[2].attr2 = ((wavePalr) << 12) | ((16)*32 + (24));
            }
        }
    }
    if (player.shieldHide) {
        shadowOAM[0].attr0 |= (2 << 8);
    } else {
        shadowOAM[0].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
        shadowOAM[0].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
        shadowOAM[0].attr2 = ((0) << 12) | ((12)*32 + (20));
    }

    if (player.healHide) {
        shadowOAM[1].attr0 |= (2 << 8);
    } else {
        if (player.healingCounter <= 20) {
            shadowOAM[1].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[1].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[1].attr2 = ((0) << 12) | ((16)*32 + (16));
        } else if (player.healingCounter <= 40) {
            shadowOAM[1].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[1].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[1].attr2 = ((0) << 12) | ((16)*32 + (20));
        } else if (player.healingCounter <= 60) {
            shadowOAM[1].attr0 = (0xFF & (player.worldRow - vOff)) | (0 << 14);
            shadowOAM[1].attr1 = (0x1FF & (player.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[1].attr2 = ((0) << 12) | ((16)*32 + (16));
        }
    }
}

void drawEnemy0() {

    if (enemy0.hide) {
        shadowOAM[8].attr0 |= (2 << 8);
    } else if (!enemy0.meleeing && !enemy0.exploding) {
        drawDigits0(192, 0, enemy0.health, 15);
        shadowOAM[8].attr0 = (0xFF & (enemy0.worldRow - vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
        shadowOAM[8].attr1 = (0x1FF & (enemy0.worldCol - (hOff + hOfflimit))) | (2 << 14);
        shadowOAM[8].attr2 = ((4) << 12) | ((enemy0.curFrame * 4 + 14)*32 + (enemy0.aniState * 4));
    } else if (enemy0.meleeing) {
        drawDigits0(192, 0, enemy0.health, 15);
        if (enemy0.meleeCounter <= 10) {
            shadowOAM[8].attr0 = (0xFF & (enemy0.worldRow - vOff)) | (0 << 14);
            shadowOAM[8].attr1 = (0x1FF & (enemy0.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[8].attr2 = ((4) << 12) | ((14)*32 + (8));
        } else if (enemy0.meleeCounter <= 20) {
            shadowOAM[8].attr0 = (0xFF & (enemy0.worldRow - vOff)) | (0 << 14);
            shadowOAM[8].attr1 = (0x1FF & (enemy0.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[8].attr2 = ((4) << 12) | ((18)*32 + (8));
        } else if (enemy0.meleeCounter <= 30) {
            shadowOAM[8].attr0 = (0xFF & (enemy0.worldRow - vOff)) | (0 << 14);
            shadowOAM[8].attr1 = (0x1FF & (enemy0.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[8].attr2 = ((4) << 12) | ((22)*32 + (8));
        }
    } else if (enemy0.exploding) {
        drawDigits0(192, 0, enemy0.health, 15);
        if (enemy0.explodingCounter <= 20) {
            shadowOAM[8].attr0 = (0xFF & (enemy0.worldRow - vOff)) | (0 << 14);
            shadowOAM[8].attr1 = (0x1FF & (enemy0.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[8].attr2 = ((4) << 12) | ((14)*32 + (12));
        } else if (enemy0.explodingCounter <= 40) {
            shadowOAM[8].attr0 = (0xFF & (enemy0.worldRow - vOff)) | (0 << 14);
            shadowOAM[8].attr1 = (0x1FF & (enemy0.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[8].attr2 = ((4) << 12) | ((18)*32 + (12));
        } else if (enemy0.explodingCounter <= 60) {
            shadowOAM[8].attr0 = (0xFF & (enemy0.worldRow - vOff)) | (0 << 14);
            shadowOAM[8].attr1 = (0x1FF & (enemy0.worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[8].attr2 = ((4) << 12) | ((22)*32 + (12));
        }
    }
}

void drawMinor1s() {
    for (int i = 0; i < 3; i++) {
        if (minor1s[i].hide) {
            shadowOAM[23+i].attr0 |= (2 << 8);
        } else if (!minor1s[i].meleeing) {
            shadowOAM[23+i].attr0 = (0xFF & (minor1s[i].worldRow - vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
            shadowOAM[23+i].attr1 = (0x1FF & (minor1s[i].worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[23+i].attr2 = ((0) << 12) | ((minor1s[i].curFrame * 4 + 20)*32 + (minor1s[i].aniState * 4 + 16));
        } else {
            shadowOAM[23+i].attr0 = (0xFF & (minor1s[i].worldRow - vOff)) | (0 << 14);
            shadowOAM[23+i].attr1 = (0x1FF & (minor1s[i].worldCol - (hOff + hOfflimit))) | (2 << 14);
            shadowOAM[23+i].attr2 = ((0) << 12) | ((28)*32 + (24));
        }
    }
}

void drawFireballs() {
    for (int i = 0; i < 5; i++) {
  if (fireballs[i].hide) {
            shadowOAM[3+i].attr0 |= (2 << 8);
        } else {
            shadowOAM[3+i].attr0 = (0xFF & (fireballs[i].worldRow - vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
            shadowOAM[3+i].attr1 = (0x1FF & (fireballs[i].worldCol - (hOff + hOfflimit))) | (0 << 14);
            shadowOAM[3+i].attr2 = ((12)*32 + (0));
        }
    }
}

void drawEyeballs() {
    for (int i = 0; i < 4; i++) {
  if (eyeballs[i].hide) {
            shadowOAM[9+i].attr0 |= (2 << 8);
        } else {
            shadowOAM[9+i].attr0 = (0xFF & (eyeballs[i].worldRow - vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
            shadowOAM[9+i].attr1 = (0x1FF & (eyeballs[i].worldCol - (hOff + hOfflimit))) | (0 << 14);
            shadowOAM[9+i].attr2 = ((12)*32 + (1));
        }
    }
}

void drawWave() {
 if (wave.hide) {
        shadowOAM[7].attr0 |= (2 << 8);
    } else if (wave.left) {
        shadowOAM[7].attr0 = (0xFF & (wave.worldRow - vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
        shadowOAM[7].attr1 = (0x1FF & (wave.worldCol - (hOff + hOfflimit))) | (1 << 14);
        shadowOAM[7].attr2 = ((12)*32 + (4));
    } else if(wave.right) {
        shadowOAM[7].attr0 = (0xFF & (wave.worldRow - vOff)) | (0 << 14) | (0 << 13) | (0 << 8);
        shadowOAM[7].attr1 = (0x1FF & (wave.worldCol - (hOff + hOfflimit))) | (1 << 14);
        shadowOAM[7].attr2 = ((12)*32 + (2));
    }
}
