/// @description Initialize player variables

// Variables
walk_speed = 16;
vx = 0;
vy = 0;
dir = 3;
move_right = 0;
move_left = 0;
move_up = 0;
move_down = 0;

nearby_npc = noone;
look_range = 30;
has_greeted = false;

// Create listener and set its position according to the player position and the 3D space
audio_listener_set_position(0, x, y, 0);
audio_listener_set_orientation(0, 0, 1, 0, 0, 0, 1);