/// @description Collisions against the rock
// 

// Destroys the player instance and sets an alarm for 2 seconds (120 frames)
effect_create_above(ef_firework, x, y, 1, c_white);
instance_destroy();
//obj_game.alarm[0] = 120;
// When the instance is destroyed, it calls for the obj_gameover, which contains the Game Over screen.
instance_create_layer(room_width/2, room_height/2, "Instances", obj_gameover);