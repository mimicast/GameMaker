/// @description Important events at the start of the game

// Global game variables
global.player_control = true;
global.game_start = false;
global.game_over = false;

// Player states
enum PLAYER_STATE {
	IDLE, // 0
	WALKING, // 1
	PICKINGUP, // 2
	CARRYING, // 3
	CARRYIDLE, // 4
	PUTTINGDOWN // 5
}

// Item States
enum ITEM_STATE {
	IDLE,
	TAKEN,
	USED, 
	PUTTING_BACK
}

// Sequence States
enum SEQ_STATE {
	NOT_PLAYING,
	WAITING,
	PLAYING,
	FINISHED
}

// NPC States
enum NPC_STATE{
	NORMAL,
	DONE
}