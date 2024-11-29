/// @description Initialize player variables

// Player Variables
my_state = PLAYER_STATE.IDLE;
walk_speed = 16;
vx = 0;
vy = 0;
dir = 3;
run_speed = 0;
run_max = 12;
running = false;
move_right = 0;
move_left = 0;
move_up = 0;
move_down = 0;
start_dust = 0;

// Player Sprite Array
// idle
player_spr[PLAYER_STATE.IDLE][0] = spr_player_idle_right;
player_spr[PLAYER_STATE.IDLE][1] = spr_player_idle_up;
player_spr[PLAYER_STATE.IDLE][2] = spr_player_idle_left;
player_spr[PLAYER_STATE.IDLE][3] = spr_player_idle_down;

// walking
player_spr[PLAYER_STATE.WALKING][0] = spr_player_walk_right;
player_spr[PLAYER_STATE.WALKING][1] = spr_player_walk_up;
player_spr[PLAYER_STATE.WALKING][2] = spr_player_walk_left;
player_spr[PLAYER_STATE.WALKING][3] = spr_player_walk_down;

// picking up
player_spr[PLAYER_STATE.PICKINGUP][0] = spr_player_pickUp_right;
player_spr[PLAYER_STATE.PICKINGUP][1] = spr_player_pickUp_up;
player_spr[PLAYER_STATE.PICKINGUP][2] = spr_player_pickUp_left;
player_spr[PLAYER_STATE.PICKINGUP][3] = spr_player_pickUp_down;

// putting down
player_spr[PLAYER_STATE.PUTTINGDOWN][0] = spr_player_putDown_right
player_spr[PLAYER_STATE.PUTTINGDOWN][1] = spr_player_putDown_up;
player_spr[PLAYER_STATE.PUTTINGDOWN][2] = spr_player_putDown_left;
player_spr[PLAYER_STATE.PUTTINGDOWN][3] = spr_player_putDown_down;

// carrying
player_spr[PLAYER_STATE.CARRYING][0] = spr_player_carry_right
player_spr[PLAYER_STATE.CARRYING][1] = spr_player_carry_up;
player_spr[PLAYER_STATE.CARRYING][2] = spr_player_carry_left;
player_spr[PLAYER_STATE.CARRYING][3] = spr_player_carry_down;

// idle while carrying
player_spr[PLAYER_STATE.CARRYIDLE][0] = spr_player_carryIdle_right
player_spr[PLAYER_STATE.CARRYIDLE][1] = spr_player_carryIdle_up;
player_spr[PLAYER_STATE.CARRYIDLE][2] = spr_player_carryIdle_left;
player_spr[PLAYER_STATE.CARRYIDLE][3] = spr_player_carryIdle_down;

// NPC Variables
nearby_npc = noone;
npc_prompt = noone;
look_range = 30;
has_greeted = false;

// Item variables
has_item = noone;
has_item_x = x;
has_item_y = y;
nearby_item = noone;
item_prompt = noone;
carry_limit = 0;

// Create listener and set its position according to the player position and the 3D space
audio_listener_set_position(0, x, y, 0);
audio_listener_set_orientation(0, 0, 1, 0, 0, 0, 1);