#include "mode0.h"
#include "text.h"
#include "spritesheet.h"

void drawDigits0(int col, int row, int num, int oam) {
    int s = 0;

    int t = 0;
    if ((num < 100) && (num >= 0)) {
        s = num % 10;
        t = num / 10;
    } 

    shadowOAM[oam].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[oam].attr1 = col | ATTR1_TINY;
	shadowOAM[oam].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(t , 31);

    shadowOAM[oam + 1].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[oam + 1].attr1 = (col + 8) | ATTR1_TINY;
	shadowOAM[oam + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(s , 31);
} 