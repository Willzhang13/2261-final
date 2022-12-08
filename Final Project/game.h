//TEMP MAP SIZE, WILL CHANGE TO LARGE LATER
#define MAPHEIGHT 256
#define MAPWIDTH1 512
#define MAPWIDTH2 1024
#define FIREBALLCOUNT 5
#define EYEBALLCOUNT 4
#define MINOR1COUNT 3

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