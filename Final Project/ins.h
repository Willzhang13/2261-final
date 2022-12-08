
//{{BLOCK(ins)

//======================================================================
//
//	ins, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 233 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7456 + 2048 = 10016
//
//	Time-stamp: 2022-04-25, 17:37:35
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INS_H
#define GRIT_INS_H

#define insTilesLen 7456
extern const unsigned short insTiles[3728];

#define insMapLen 2048
extern const unsigned short insMap[1024];

#define insPalLen 512
extern const unsigned short insPal[256];

#endif // GRIT_INS_H

//}}BLOCK(ins)
