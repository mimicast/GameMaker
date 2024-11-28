/// @description Player Logic

move_up = keyboard_check(ord("W"));
move_left = keyboard_check(ord("A"));
move_down = keyboard_check(ord("S"));
move_right = keyboard_check(ord("D"));

// Determines the player horizontal movement
vx = ((move_right - move_left) * walk_speed);
vy = ((move_down - move_up) * walk_speed);

// If Idle
if (vx == 0 && vy == 0) {
	// Change idle based on last direction
	switch dir {
		case 0: 
			sprite_index = spr_player_idle_right; 
			break;
		case 1: 
			sprite_index = spr_player_idle_up; 
			break;
		case 2: 
			sprite_index = spr_player_idle_left; 
			break;
		case 3: 
			sprite_index = spr_player; 
			break;
	}
}

// If the player is moving, apply the direction to the x axis
if (vx != 0 || vy != 0) {
	// Look ahead for any object that's part of the parent environmnent and check for collisions
	if !collision_point(x + vx, y, obj_parent_environment, true, true) {
		x += vx;
	}
	if !collision_point(x, y + vy, obj_parent_environment, true, true) {
		y += vy;
	}
	// Change the sprite according to the direction the player is watching
	if (vx > 0) {
		sprite_index = spr_player_walk_right;
		dir = 0;
	} else if (vx < 0) {
		sprite_index = spr_player_walk_left;
		dir = 2;
	}
	
	if (vy > 0) {
		sprite_index = spr_player_walk_down
		dir = 3;
	} else if (vy < 0) {
		sprite_index = spr_player_walk_up
		dir = 1;		
	}
	
	// Move audio listener with the player
	audio_listener_set_position(0, x, y, 0);
}

// Check for collisions with NPCs. 

//This collision detecton differs from collision_point, as it checks in a specified area from look_range rather than a specific point in space.
nearby_npc = collision_rectangle(x - look_range, y - look_range, x + look_range, y + look_range, obj_parent_npc, false, true);


if nearby_npc {
	// Play greeting sound if the player has not greeted them (has collided with the NPC)
	if !has_greeted {
		// Check if the greeting sound is not currently playing, so it doesn't play multiple times when colliding repeatedly with the NPC
		if !(audio_is_playing(snd_greeting01)) {
			audio_play_sound(snd_greeting01, 1, 0);
			has_greeted = true;
		}
	}
	//show_debug_message("Found NPC");
} else {
	// do something else
	if has_greeted {
		has_greeted = false;
	}
	show_debug_message("No NPC found");
}


// Changes the depth of the player according to its Y position on the room.
depth = -y;