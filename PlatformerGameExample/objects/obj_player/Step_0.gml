/// @description Core Player Logic - Events that happen every second

// Get Player Inputs (WASD): Bit Boolean (False/0 & True/1)
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
// Checks if the key was pressed on one step, not hold down
key_jump = keyboard_check_pressed(vk_space);

// Calculate movement
var _move = key_right - key_left;

player_hspd = _move * player_walk_spd;
player_vspd = player_vspd + player_grav;

// Verify if the position the player is jumping from cointains a wall
if (place_meeting(x, y+1, obj_invisible_wall)) && (key_jump) {
	player_vspd = -player_jump_spd;
}

// Horizontal Collision
// Verify if the position the player is moving into contains a wall
if (place_meeting(x + player_hspd, y, obj_invisible_wall)) {
	// Move one pixel at a time until the player reaches a wall
	while (!place_meeting(x + sign(player_hspd), y ,obj_invisible_wall)) {
		x = x + sign(player_hspd);
	}
	player_hspd = 0;
}
x = x + player_hspd;

// Vertical Collision
// Verify if the position the player is moving into contains a floor
if (place_meeting(x, y + player_vspd, obj_invisible_wall)) {
	// Move one pixel at a time until the player reaches a wall
	while (!place_meeting(x, y + sign(player_vspd), obj_invisible_wall)) {
		y = y + sign(player_vspd);
	}
	player_vspd = 0;
}
y = y + player_vspd;

// Animation Code

// Changes the sprite to the Jump sprite, using the first frame for jumping up and the second frame for falling.
if (!place_meeting(x, y+1, obj_invisible_wall)) {
	sprite_index = spr_player_air;
	image_speed = 0; // Prevent the sprite from animating
	if (player_vspd > 0) {
		image_index = 1;
	} else {
		image_index = 0;
	}
}
else {
	image_speed = 1; // Let the sprite animate, in case a previous change made it stop.
	// Set the correct sprite for idle or walking
	if (player_hspd == 0) {
		sprite_index = spr_player_idle;
	} else {
		sprite_index = spr_player_walk;
	}
}

// Flips the image according to the horizontal speed, changing the orientation of the player sprite.
if (player_hspd != 0 ) {
	image_xscale = sign(player_hspd);
}