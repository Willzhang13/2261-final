
//{{BLOCK(UI)

//======================================================================
//
//	UI, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 54 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1728 + 2048 = 4288
//
//	Time-stamp: 2022-04-27, 18:58:26
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_UI_H
#define GRIT_UI_H

#define UITilesLen 1728
extern const unsigned short UITiles[864];

#define UIMapLen 2048
extern const unsigned short UIMap[1024];

#define UIPalLen 512
extern const unsigned short UIPal[256];

#endif // GRIT_UI_H

//}}BLOCK(UI)
