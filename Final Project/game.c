#include "mode0.h"
#include "game.h"
#include "background0.h"
#include "text.h"
#include "collisionmap.h"
#include "UI.h"

#include "soundTime.h"
#include "meleeSound.h"
#include "dashSound.h"
#include "slamSound.h"
#include "swingSound.h"
#include "waveSound.h"
#include "fireballSound.h"

OBJ_ATTR shadowOAM[128];
PLAYER player;
ENEMY0 enemy0;
MINOR1 minor1s[MINOR1COUNT];
FIREBALL fireballs[FIREBALLCOUNT];
FIREBALL eyeballs[EYEBALLCOUNT];
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
    DMANow(3, background0Tiles, &CHARBLOCK[1], background0TilesLen / 2);
    DMANow(3, background0Map, &SCREENBLOCK[27], background0MapLen / 2);
    cheat = 0;
    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;
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
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE | BG_4BPP;
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
            SCREENBLOCK[27].tilemap[OFFSET(j, i, 32)] = SCREENBLOCK[27].tilemap[OFFSET(j + 2, i, 32)];
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
            SCREENBLOCK[27].tilemap[OFFSET(j, i, 32)] = SCREENBLOCK[27].tilemap[OFFSET(j, i-8, 32)];
        }
    }
    for (int i = 12; i <= 15; i++) {
        for (int j = 0; j <= 7; j++) {
            SCREENBLOCK[28].tilemap[OFFSET(j, i, 32)] = SCREENBLOCK[28].tilemap[OFFSET(j, i-8, 32)];
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
            SCREENBLOCK[28].tilemap[OFFSET(j, i, 32)] = SCREENBLOCK[27].tilemap[OFFSET(j - 4, i, 32)];
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
            SCREENBLOCK[30].tilemap[OFFSET(j, i, 32)] = SCREENBLOCK[30].tilemap[OFFSET(j + 4, i, 32)];
        }
    }
}

void updateGame() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
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
    for (int i = 0; i < FIREBALLCOUNT; i++) {
		updateFireball(&fireballs[i]);
	}
    for (int i = 0; i < EYEBALLCOUNT; i++) {
		updateEyeball(&eyeballs[i]);
	}
    for (int i = 0; i < MINOR1COUNT; i++) {
		updateMinor1(&minor1s[i]);
	}
	updateWave();

    if (collisionMap[OFFSET(player.worldCol + player.width, player.worldRow + player.height / 2, MAPWIDTH2)]== 1) {
        if (!door1Opened && (enemykilled >= 1))
            openFirst();
    }

    if (collisionMap[OFFSET(player.worldCol + player.width / 2, player.worldRow, MAPWIDTH2)] == 2) {
        if (!door2Opened && (enemykilled >= 3))
            openSecond();
    }

    if (collisionMap[OFFSET(player.worldCol + player.width, player.worldRow + player.height / 2, MAPWIDTH2)]== 3) {
        if (!door3Opened && (enemykilled >= 5))
            openThird();
    }

    if (collisionMap[OFFSET(player.worldCol + player.width, player.worldRow + player.height / 2, MAPWIDTH2)]== 4) {
        if (!BossOpened && (enemykilled >= 8))
            openBoss();
    }

    if (player.worldCol >= 490 && player.worldCol < 512) {
        screenBlock = 29;
        hOff = 0;
        hOfflimit = 512;
        REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE | BG_4BPP;
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


    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}

void drawGame() {

    drawPlayer();
    drawEnemy0();
    drawMinor1s();
	drawFireballs();
    drawEyeballs();
    drawWave();

    if (!player.wavable) {
        shadowOAM[18].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[18].attr1 = 15 | ATTR1_TINY;
	    shadowOAM[18].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0 , 30);
    } else {
        shadowOAM[18].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[18].attr1 = 15 | ATTR1_TINY;
	    shadowOAM[18].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10 , 31);
    }

    if (!player.swingable) {
        shadowOAM[19].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[19].attr1 = 28 | ATTR1_TINY;
	    shadowOAM[19].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0 , 30);
    } else {
        shadowOAM[19].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[19].attr1 = 28 | ATTR1_TINY;
	    shadowOAM[19].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10 , 31);
    }

    if (!player.slammable) {
        shadowOAM[20].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[20].attr1 = 41 | ATTR1_TINY;
	    shadowOAM[20].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0 , 30);
    } else {
        shadowOAM[20].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[20].attr1 = 41 | ATTR1_TINY;
	    shadowOAM[20].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10 , 31);
    }

    if (!player.healable) {
        shadowOAM[21].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[21].attr1 = 54 | ATTR1_TINY;
	    shadowOAM[21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0 , 30);
    } else {
        shadowOAM[21].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[21].attr1 = 54 | ATTR1_TINY;
	    shadowOAM[21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10 , 31);
    }

    if (!player.shieldable) {
        shadowOAM[22].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[22].attr1 = 67 | ATTR1_TINY;
	    shadowOAM[22].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0 , 30);
    } else {
        shadowOAM[22].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[22].attr1 = 67 | ATTR1_TINY;
	    shadowOAM[22].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10 , 31);
    }

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

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
	for (int i = 0; i < MINOR1COUNT; i++) {
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
	for (int i = 0; i < FIREBALLCOUNT; i++) {
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
	for (int i = 0; i < EYEBALLCOUNT; i++) {
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
    if(BUTTON_HELD(BUTTON_UP)
    && collisionCheck(collisionMap, MAPWIDTH2, player.worldCol, player.worldRow, player.width, player.height, 0, - player.rdel) &&
    (!collision(blockers[1].worldCol, blockers[1].worldRow, blockers[1].width, blockers[1].height, 
        player.worldCol, player.worldRow - player.rdel, player.width, player.height) | !blockers[1].active)) {
        if ((player.worldRow - player.rdel >= 0) ) {
            player.worldRow -= player.rdel;
        }

        if ((SCREENHEIGHT / 2 >= player.worldRow - vOff) && (vOff > 0)) {
            vOff -= player.rdel;
        }
    }

    if(BUTTON_HELD(BUTTON_DOWN)) {
        if ((player.worldRow + player.height + player.rdel <= MAPHEIGHT) &&
        collisionCheck(collisionMap, MAPWIDTH2, player.worldCol, player.worldRow, player.width, player.height, 0, player.rdel)){
            player.worldRow += player.rdel;
        }

        if ((SCREENHEIGHT / 2 <= player.worldRow - vOff) && (vOff + SCREENHEIGHT < MAPHEIGHT)) {
            vOff += player.rdel;
        }
    }

    if(BUTTON_HELD(BUTTON_LEFT)) {
        if ((player.worldCol - player.cdel >= hOfflimit) && 
        collisionCheck(collisionMap, MAPWIDTH2, player.worldCol, player.worldRow, player.width, player.height, -player.cdel, 0)
        ) {
            player.worldCol -= player.cdel;
        }

        if ((SCREENWIDTH / 2 >= (player.worldCol + player.width - (hOff + hOfflimit))) && (hOff > 0)) {
            hOff -= player.cdel;
        }
    }

    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if ((player.worldCol + player.width + player.cdel <= MAPWIDTH2) && 
        collisionCheck(collisionMap, MAPWIDTH2, player.worldCol, player.worldRow, player.width, player.height, player.cdel, 0) &&
        (!collision(blockers[0].worldCol, blockers[0].worldRow, blockers[0].width, blockers[0].height, 
        player.worldCol + player.cdel, player.worldRow, player.width, player.height) | !blockers[0].active) &&
        (!collision(blockers[2].worldCol, blockers[2].worldRow, blockers[2].width, blockers[2].height, 
        player.worldCol + player.cdel, player.worldRow, player.width, player.height) | !blockers[2].active) &&
        (!collision(blockers[3].worldCol, blockers[3].worldRow, blockers[3].width, blockers[3].height, 
        player.worldCol + player.cdel, player.worldRow, player.width, player.height) | !blockers[3].active)
        ) {
            player.worldCol += player.cdel;
        }

        if ((SCREENWIDTH / 2 <= player.worldCol - (hOff + hOfflimit)) && (hOff + SCREENWIDTH < MAPWIDTH1)) {
            hOff += player.cdel;
        }
    }


    if(BUTTON_HELD(BUTTON_R)) {
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


    if (BUTTON_PRESSED(BUTTON_L) && player.healable) {
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



    if ((BUTTON_HELD(BUTTON_LEFT) ^ BUTTON_HELD(BUTTON_RIGHT)) && BUTTON_PRESSED(BUTTON_A) && 
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
        for (int i = 0; i < MINOR1COUNT; i++) {
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
        for (int i = 0; i < MINOR1COUNT; i++) {
            if (minor1s[i].dashed) {
                minor1s[i].health -= player.dashDamage;
                minor1s[i].dashed = 0;
            }
        }
    }

    if (player.dashCDstarts) {
        REG_TM2CNT = 0;
        REG_TM2D = (65536 - 16384);
        REG_TM2CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;

        shadowOAM[17].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[17].attr1 = 2 | ATTR1_TINY;
	    shadowOAM[17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.dashCD - player.dashCDcounter , 31);

        player.dashCDstarts = 0;
    }

    if (player.dashCDcounter >= player.dashCD) {
        REG_TM2CNT = TIMER_OFF;
        player.dashCDcounter = 0;
        player.dashable = 1;
        player.dashCDstarts = 0;
        shadowOAM[17].attr0 = 149 | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[17].attr1 = 2 | ATTR1_TINY;
	    shadowOAM[17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10 , 31);
    }



    if (BUTTON_HELD(BUTTON_UP) && BUTTON_PRESSED(BUTTON_A) && player.swingable && !player.dashing 
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
            for (int i = 0; i < MINOR1COUNT; i++) {
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



    if (BUTTON_HELD(BUTTON_DOWN) && BUTTON_PRESSED(BUTTON_A) && player.slammable && !player.dashing 
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
        for (int i = 0; i < MINOR1COUNT; i++) {
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
        for (int i = 0; i < MINOR1COUNT; i++) {
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
    
    

    if (BUTTON_PRESSED(BUTTON_A) && !player.swinging && !player.slamming && !player.dashing && !player.fireballing 
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
        for (int i = 0; i < MINOR1COUNT; i++) {
            if (minor1s[i].meleed) {
                minor1s[i].health -= player.meleeDamage;
                minor1s[i].meleed = 0;
            }
        }
        player.meleeable = 1;
    }
    


    if ((BUTTON_HELD(BUTTON_LEFT) ^ BUTTON_HELD(BUTTON_RIGHT)) && BUTTON_PRESSED(BUTTON_B) && 
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


    if (BUTTON_PRESSED(BUTTON_B) && !player.swinging && !player.slamming && !player.dashing && !player.meleeing 
    && !player.waving && player.fireballable) {
        playSoundB(fireballSound_data, fireballSound_length, 0);
        player.attacking = 1;
        player.fireballing = 1;
        player.fireballable = 0;
        for (int i = 0; i < FIREBALLCOUNT; i++) {
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


    for (int i = 0; i < EYEBALLCOUNT; i++) {
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

        // Control movement and change animation state
        if(BUTTON_HELD(BUTTON_LEFT)) {
            player.aniState = PLAYERLEFT;
        } else if(BUTTON_HELD(BUTTON_RIGHT)) {
            player.aniState = PLAYERRIGHT;
        } else if(BUTTON_HELD(BUTTON_UP)) {
            if (player.prevAniState == PLAYERRIGHTATTACK) {
                player.aniState = PLAYERRIGHT;
            } else if (player.prevAniState == PLAYERLEFTATTACK) {
                player.aniState = PLAYERLEFT;
            } else {
                player.aniState = player.prevAniState;
            }
        } else if(BUTTON_HELD(BUTTON_DOWN)) {
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

        // Control movement and change animation state
        if(BUTTON_HELD(BUTTON_LEFT))
            player.aniState = PLAYERLEFTATTACK;
        if(BUTTON_HELD(BUTTON_RIGHT))
            player.aniState = PLAYERRIGHTATTACK;

        if (player.aniState == PLAYERRIGHTATTACK) {
            if (collision(player.worldCol, player.worldRow, player.width + 8, player.height, 
            enemy0.worldCol, enemy0.worldRow, enemy0.width, enemy0.height)) {
                enemy0.meleed = 1;
            }
            for (int i = 0; i < MINOR1COUNT; i++) {
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
            for (int i = 0; i < MINOR1COUNT; i++) {
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
        if (enemy0.explodable && !enemy0.meleeing)  {
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
            for (int i = 0; i < EYEBALLCOUNT; i++) {
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
                && collisionCheck(collisionMap, MAPWIDTH2, enemy0.worldCol, enemy0.worldRow, 
                enemy0.width, enemy0.height, 0, - enemy0.rdel)) {
                    enemy0.worldRow -= enemy0.rdel;
                }
            } else if (enemy0.worldRow < player.worldRow) {
                if ((enemy0.worldRow + enemy0.height + enemy0.rdel <= MAPHEIGHT) &&
                collisionCheck(collisionMap, MAPWIDTH2, enemy0.worldCol, 
                enemy0.worldRow, enemy0.width, enemy0.height, 0, enemy0.rdel)){
                    enemy0.worldRow += enemy0.rdel;
                }
            }
            if(enemy0.worldCol > player.worldCol) {
                if ((enemy0.worldCol - enemy0.cdel >= hOfflimit) &&
                collisionCheck(collisionMap, MAPWIDTH2, enemy0.worldCol, 
                enemy0.worldRow, enemy0.width, enemy0.height, -enemy0.cdel, 0)) {
                    enemy0.worldCol -= enemy0.cdel;
                    enemy0.aniState = BOSSLEFT;
                }
            } else if(enemy0.worldCol < player.worldCol) {
                if ((enemy0.worldCol + enemy0.width + enemy0.cdel <= MAPWIDTH1 + hOfflimit) &&
                collisionCheck(collisionMap, MAPWIDTH2, enemy0.worldCol, 
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

    
    

        for (int i = 0; i < FIREBALLCOUNT; i++) {
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
                && collisionCheck(collisionMap, MAPWIDTH2, m->worldCol, m->worldRow, 
                m->width, m->height, 0, - m->rdel) && (!collision(blockers[1].worldCol, blockers[1].worldRow, blockers[1].width, blockers[1].height, 
        m->worldCol, m->worldRow - m->rdel, m->width, m->height) | !blockers[1].active)) {
                    m->worldRow -= m->rdel;
                }
            } else if (m->worldRow < player.worldRow) {
                if ((m->worldRow + m->height + m->rdel <= MAPHEIGHT) &&
                collisionCheck(collisionMap, MAPWIDTH2, m->worldCol, 
                m->worldRow, m->width, m->height, 0, m->rdel)){
                    m->worldRow += m->rdel;
                }
            }
            if(m->worldCol > player.worldCol) {
                if ((m->worldCol - m->cdel >= hOfflimit) &&
                collisionCheck(collisionMap, MAPWIDTH2, m->worldCol, 
                m->worldRow, m->width, m->height, -m->cdel, 0) ) {
                    m->worldCol -= m->cdel;
                    m->aniState = BOSSLEFT;
                }
            } else if(m->worldCol < player.worldCol) {
                if ((m->worldCol + m->width + m->cdel <= MAPWIDTH1 + hOfflimit) &&
                collisionCheck(collisionMap, MAPWIDTH2, m->worldCol, 
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

    
    

        for (int i = 0; i < FIREBALLCOUNT; i++) {
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
        f->cdel >= MAPWIDTH1 + hOfflimit) | (collisionMap[OFFSET(f->worldCol + f->width, f->worldRow, MAPWIDTH2)] == 0) |
        (collisionMap[OFFSET(f->worldCol + f->width, f->worldRow + f->height - 1, MAPWIDTH2)] == 0) | 
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
	if ((f->worldCol - f->cdel <= hOfflimit) | (f->worldCol + f->width + f->cdel >= MAPWIDTH1 + hOfflimit) |
    (f->worldRow - f->rdel <= 0) | (f->worldRow + f->height + f->rdel >= MAPHEIGHT)) {
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
	if ((wave.worldCol - wave.cdel <= hOfflimit) | (wave.worldCol + wave.width + wave.cdel >= MAPWIDTH1 + hOfflimit)) {
		wave.hide = 1;
        wave.left = 0;
        wave.right = 0;
        if(enemy0.waved) {
            enemy0.health -= player.waveDamage;
            enemy0.waved = 0;
        }
        for (int i = 0; i < MINOR1COUNT; i++) {
            if(minor1s[i].waved) {
                minor1s[i].health -= player.waveDamage;
                minor1s[i].waved = 0;
            }
        }
        player.wavable = 1;
	}
}

void drawPlayer() {
    //showing health
    drawDigits0(73, 9, player.health, 13);
    if (player.hide) {
        shadowOAM[2].attr0 |= ATTR0_HIDE;
    } else if (!player.attacking){
        shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
        shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
        shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(player.aniState * 4, player.curFrame * 4);
    } else if (player.meleeing && !player.dashing && !player.swinging && !player.fireballing && !player.slamming
    && !player.waving) { 
        if (player.aniState == PLAYERRIGHTATTACK) {
            if (player.meleeCounter <= 10) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(8, 4);
            } else if (player.meleeCounter <= 20) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(8, 8);
            } else if (player.meleeCounter <= 30) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(8, 0);
            }
        } else if (player.aniState == PLAYERLEFTATTACK) {
            if (player.meleeCounter <= 10) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(12, 4);
            } else if (player.meleeCounter <= 20) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(12, 8);
            } else if (player.meleeCounter <= 30) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(12, 0);
            }
        }
    } else if (player.dashing && !player.swinging && !player.slamming && !player.meleeing && !player.fireballing
    && !player.waving) {
        if (player.aniState == PLAYERRIGHT) {
            shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(28, 0);

        } else if (player.aniState == PLAYERLEFT) {
            shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(24, 0);

        }
    } else if (player.swinging && !player.dashing && !player.slamming && !player.meleeing && !player.fireballing
    && !player.waving) {
        if (player.swingingCounter <= 10) {
            shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(16, 0);
        } else if (player.swingingCounter <= 20) {
            shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(16, 4);
        } else if (player.swingingCounter <= 30) {
            shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(16, 8);
        } else if (player.swingingCounter <= 40) {
            shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(swordPalr) | ATTR2_TILEID(16, 12);
        }
    } else if (player.slamming && !player.dashing && !player.swinging && !player.meleeing && !player.fireballing
    && !player.waving) {
        if (player.slammingCounter <= 10) {
            shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(firePalr) | ATTR2_TILEID(20, 0);
        } else if (player.slammingCounter <= 20) {
            shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(firePalr) | ATTR2_TILEID(20, 4);
        } else if (player.slammingCounter <= 40) {
            shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(firePalr) | ATTR2_TILEID(20, 8);
        }
    } else if (player.fireballing && !player.swinging && !player.slamming && !player.meleeing && !player.dashing
    && !player.waving) {
        if (player.aniState == PLAYERRIGHT) {
            shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(firePalr) | ATTR2_TILEID(28, 4);

        } else if (player.aniState == PLAYERLEFT) {
            shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[2].attr2 = ATTR2_PALROW(firePalr) | ATTR2_TILEID(24, 4);
        }
    } else if (player.waving && !player.swinging && !player.slamming && !player.meleeing && !player.dashing
    && !player.fireballing) {
        if (player.aniState == PLAYERRIGHT) {
            if (player.wavingCounter <= 5) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(wavePalr) | ATTR2_TILEID(28, 8);
            } else if (player.wavingCounter <= 10) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(wavePalr) | ATTR2_TILEID(28, 12);
            } else if (player.wavingCounter <= 15) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(wavePalr) | ATTR2_TILEID(28, 16);
            }
        } else if (player.aniState == PLAYERLEFT) {
            if (player.wavingCounter <= 5) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(wavePalr) | ATTR2_TILEID(24, 8);
            } else if (player.wavingCounter <= 10) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(wavePalr) | ATTR2_TILEID(24, 12);
            } else if (player.wavingCounter <= 15) {
                shadowOAM[2].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
                shadowOAM[2].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
                shadowOAM[2].attr2 = ATTR2_PALROW(wavePalr) | ATTR2_TILEID(24, 16);
            }
        }
    }
    if (player.shieldHide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 12);
    }

    if (player.healHide) {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    } else {
        if (player.healingCounter <= 20) {
            shadowOAM[1].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[1].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 16);
        } else if (player.healingCounter <= 40) {
            shadowOAM[1].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[1].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 16);
        } else if (player.healingCounter <= 60) {
            shadowOAM[1].attr0 = (ROWMASK & (player.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[1].attr1 = (COLMASK & (player.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 16);
        }
    }
}

void drawEnemy0() {
    
    if (enemy0.hide) {
        shadowOAM[8].attr0 |= ATTR0_HIDE;
    } else if (!enemy0.meleeing && !enemy0.exploding) {
        drawDigits0(192, 0, enemy0.health, 15);
        shadowOAM[8].attr0 = (ROWMASK & (enemy0.worldRow - vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
        shadowOAM[8].attr1 = (COLMASK & (enemy0.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
        shadowOAM[8].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(enemy0.aniState * 4, enemy0.curFrame * 4 + 14);
    } else if (enemy0.meleeing) {
        drawDigits0(192, 0, enemy0.health, 15);
        if (enemy0.meleeCounter <= 10) {
            shadowOAM[8].attr0 = (ROWMASK & (enemy0.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[8].attr1 = (COLMASK & (enemy0.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[8].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(8, 14);
        } else if (enemy0.meleeCounter <= 20) {
            shadowOAM[8].attr0 = (ROWMASK & (enemy0.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[8].attr1 = (COLMASK & (enemy0.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[8].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(8, 18);
        } else if (enemy0.meleeCounter <= 30) {
            shadowOAM[8].attr0 = (ROWMASK & (enemy0.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[8].attr1 = (COLMASK & (enemy0.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[8].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(8, 22);
        }
    } else if (enemy0.exploding) {
        drawDigits0(192, 0, enemy0.health, 15);
        if (enemy0.explodingCounter <= 20) {
            shadowOAM[8].attr0 = (ROWMASK & (enemy0.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[8].attr1 = (COLMASK & (enemy0.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[8].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(12, 14);
        } else if (enemy0.explodingCounter <= 40) {
            shadowOAM[8].attr0 = (ROWMASK & (enemy0.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[8].attr1 = (COLMASK & (enemy0.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[8].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(12, 18);
        } else if (enemy0.explodingCounter <= 60) {
            shadowOAM[8].attr0 = (ROWMASK & (enemy0.worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[8].attr1 = (COLMASK & (enemy0.worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[8].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(12, 22);
        }
    }
}

void drawMinor1s() {
    for (int i = 0; i < MINOR1COUNT; i++) {
        if (minor1s[i].hide) {
            shadowOAM[23+i].attr0 |= ATTR0_HIDE;
        } else if (!minor1s[i].meleeing) {
            shadowOAM[23+i].attr0 = (ROWMASK & (minor1s[i].worldRow - vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
            shadowOAM[23+i].attr1 = (COLMASK & (minor1s[i].worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[23+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(minor1s[i].aniState * 4 + 16, minor1s[i].curFrame * 4 + 20);
        } else {
            shadowOAM[23+i].attr0 = (ROWMASK & (minor1s[i].worldRow - vOff)) | ATTR0_SQUARE;
            shadowOAM[23+i].attr1 = (COLMASK & (minor1s[i].worldCol - (hOff + hOfflimit))) | ATTR1_MEDIUM;
            shadowOAM[23+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 28);
        }
    }
}

void drawFireballs() {
    for (int i = 0; i < FIREBALLCOUNT; i++) {
		if (fireballs[i].hide) {
            shadowOAM[3+i].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[3+i].attr0 = (ROWMASK & (fireballs[i].worldRow - vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
            shadowOAM[3+i].attr1 = (COLMASK & (fireballs[i].worldCol - (hOff + hOfflimit))) | ATTR1_TINY;
            shadowOAM[3+i].attr2 = ATTR2_TILEID(0, 12);
        }
    }
}

void drawEyeballs() {
    for (int i = 0; i < EYEBALLCOUNT; i++) {
		if (eyeballs[i].hide) {
            shadowOAM[9+i].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[9+i].attr0 = (ROWMASK & (eyeballs[i].worldRow - vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
            shadowOAM[9+i].attr1 = (COLMASK & (eyeballs[i].worldCol - (hOff + hOfflimit))) | ATTR1_TINY;
            shadowOAM[9+i].attr2 = ATTR2_TILEID(1, 12);
        }
    }
}

void drawWave() {
	if (wave.hide) {
        shadowOAM[7].attr0 |= ATTR0_HIDE;
    } else if (wave.left) {
        shadowOAM[7].attr0 = (ROWMASK & (wave.worldRow - vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
        shadowOAM[7].attr1 = (COLMASK & (wave.worldCol - (hOff + hOfflimit))) | ATTR1_SMALL;
        shadowOAM[7].attr2 = ATTR2_TILEID(4, 12);
    } else if(wave.right) {
        shadowOAM[7].attr0 = (ROWMASK & (wave.worldRow - vOff)) | ATTR0_SQUARE | ATTR0_4BPP | ATTR0_REGULAR;
        shadowOAM[7].attr1 = (COLMASK & (wave.worldCol - (hOff + hOfflimit))) | ATTR1_SMALL;
        shadowOAM[7].attr2 = ATTR2_TILEID(2, 12);
    }
}
