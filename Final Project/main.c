//read the READMEM4 file for the comments on the project!!!

#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "spritesheet.h"
#include "start.h"
#include "ins.h"
#include "paused.h"
#include "lose.h"
#include "win.h"
#include "game.h"
#include "text.h"
#include "UI.h"
#include "background0.h"

#include "winSong.h"
#include "startSong.h"
#include "gameSong.h"
#include "loseSong.h"
#include "soundTime.h"

// Prototypes.
void initialize();

// State Prototypes.
void goToStart();
void start();
void goToGame();
void game();
void goToIns();
void ins();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States.
enum {
    START,
    GAME,
    INS,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables.
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM.
OBJ_ATTR shadowOAM[128];

int main() {
    initialize();

    while (1) {
        // Update button variables.
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine.
        switch (state) {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case INS:
            ins();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA.
void initialize() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE |SPRITE_ENABLE; // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites.
    // Don't forget to set up whatever BGs you enabled in the line above!
    //*curently working everything on a single small background, will create & extend game background to large in the future after map design
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL| BG_4BPP;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_SIZE_WIDE | BG_4BPP;
    hideSprites();
    buttons = BUTTONS;
    oldButtons = 0;

    setupSounds();
    setupInterrupts();

    goToStart();
}

// Sets up the start state.
void goToStart() {
    playSoundA(startSong_data, startSong_length, 1);
    DMANow(3, startPal, PALETTE, 256);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[31], startMapLen / 2);
    state = START;
}

// Runs every frame of the start state.
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(gameSong_data, gameSong_length, 1);
        goToGame();
        initGame();
    } if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToIns();
    }
}

void goToIns() {
    stopSound();
    DMANow(3, insPal, PALETTE, 256);
    DMANow(3, insTiles, &CHARBLOCK[0], insTilesLen / 2);
    DMANow(3, insMap, &SCREENBLOCK[31], insMapLen / 2);
    state = INS;
}

void ins() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundA(gameSong_data, gameSong_length, 1);
        goToGame();
        initGame();
    } if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the game state.
void goToGame() {
    DMANow(3, background0Pal, PALETTE, 256);
    DMANow(3, UITiles, &CHARBLOCK[0], UITilesLen / 2);
    DMANow(3, UIMap, &SCREENBLOCK[31], UIMapLen / 2);


    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = GAME;
}

// Runs every frame of the game state.
void game() {
    updateGame();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)){
        pauseSound();
        goToPause();
    }
    if (!bossAlive()){
        goToWin();
    }
    if (!playerAlive()){
        goToLose();
    } 
}

// Sets up the pause state.
void goToPause() {
    state = PAUSE;
    hideSprites();
    DMANow(3, pausedPal, PALETTE, 256);
    DMANow(3, pausedTiles, &CHARBLOCK[0], pausedTilesLen / 2);
    DMANow(3, pausedMap, &SCREENBLOCK[31], pausedMapLen / 2);
}

// Runs every frame of the pause state.
void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSound();
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state.
void goToWin() {
    state = WIN;
    hideSprites();
    DMANow(3, winPal, PALETTE, 256);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[31], winMapLen / 2);
    stopSound();
    playSoundA(winSong_data, winSong_length, 1);
}

// Runs every frame of the win state.
void win() {
    if (BUTTON_PRESSED(BUTTON_START)){
        goToStart();
    }
}

// Sets up the lose state.
void goToLose() {
    state = LOSE;
    hideSprites();
    DMANow(3, losePal, PALETTE, 256);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[31], loseMapLen / 2);
    stopSound();
    playSoundA(loseSong_data, loseSong_length, 1);
}

// Runs every frame of the lose state.
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)){
        goToStart();
    }
}