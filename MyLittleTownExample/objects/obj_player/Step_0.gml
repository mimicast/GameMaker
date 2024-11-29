/// @description Player Logic

// Keyboard Input. Keyboard_check returns a binary boolean (True = 1, False = 0) ##KeyboardInput
if (global.player_control == true) {
	move_up = keyboard_check(ord("W"));
	move_left = keyboard_check(ord("A"));
	move_down = keyboard_check(ord("S"));
	move_right = keyboard_check(ord("D"));
}
if (global.player_control == false) {
	move_up = 0;
	move_left = 0;
	move_down = 0;
	move_right = 0;
}

// Run with Shift Key
running = keyboard_check(vk_shift);

// Modify the speed if the player is running or not ##PlayerRun
if (running) {
	if (run_speed < run_max) {
		run_speed += 2;
	}
	// Start creating dust
	if (start_dust == 0) {
		alarm[0] = 2;
		start_dust = 1;
	}
} else {
	if (run_speed > 0) {
		run_speed -= 1;
	}
	start_dust = 0;
}

// Determines the player horizontal and vertical movement (Results: -1, 0 or 1)
vx = ((move_right - move_left) * (walk_speed + run_speed) * (1 - carry_limit));
vy = ((move_down - move_up) * (walk_speed + run_speed) * (1 - carry_limit));

// Changes idle sprite according to specific events ##PlayerIdle
if (vx == 0 && vy == 0) {
	// Plays the correct idle animation if the player is picking up or putting down items.
	if (my_state != PLAYER_STATE.PICKINGUP && my_state != PLAYER_STATE.PUTTINGDOWN) {
		if (has_item == noone) {
			my_state = PLAYER_STATE.IDLE;
		} 
		else {
			my_state = PLAYER_STATE.CARRYIDLE;
		}
	}
}

// If the player is moving, apply the direction to the x axis ##PlayerMovement
if (vx != 0 || vy != 0) {
	// Look ahead for any object that's part of the parent environment and check for collisions
	if !collision_point(x + vx, y, obj_parent_environment, true, true) {
		x += vx;
	}
	if !collision_point(x, y + vy, obj_parent_environment, true, true) {
		y += vy;
	}
	
	// Change the sprite according to the direction the player is watching
	 if (vx > 0) {
		 dir = 0;
	 }
	 if (vx < 0) {
		 dir = 2;
	 }
	 
	 if (vy > 0) {
		 dir = 3;
	 }
	 if (vy < 0) {
		 dir = 1
	 }
	 
	 // Sets the player state depending on if they are carrying an item or not.
	 if (has_item == noone) {
		 my_state = PLAYER_STATE.WALKING;
	 }
	 else {
		 my_state = PLAYER_STATE.CARRYING;
	 }
	
	// Set my listener if either a Sequence or 3D audio are playing
	if (instance_exists(obj_control) && obj_control.sequence_state == SEQ_STATE.PLAYING) {
		var _cam_x = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0]) * 0.5)
		var _cam_y = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0]) * 0.5)
	
		//show_debug_message("Position: _cam_x=" + string(_cam_x) + ", _cam_y=" + string(_cam_y));	
		audio_listener_set_position(0, _cam_x, _cam_y, 0);
	} else {
		audio_listener_set_position(0, x, y, 0);
	}
	//show_debug_message(string(SEQ_STATE.PLAYING));
}

// Check for collisions with NPCs. ##NPCCollision
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
	// Shows the prompt icon on top of the NPC
	if (npc_prompt = noone || npc_prompt == undefined) {
		npc_prompt = scr_show_prompt(nearby_npc, nearby_npc.x, nearby_npc.y-200);
	}
} else {
	// do something else
	if has_greeted {
		has_greeted = false;
	}
	// Removes the GUI prompt
	scr_dismiss_prompt(npc_prompt, 0);
}

// Check for collision with items ##ItemCollision
nearby_item = collision_rectangle(x - look_range, y - look_range, x + look_range, y + look_range, obj_parent_item, false, true);

if (nearby_item && !nearby_npc) {
	// Pop up prompt
	if (item_prompt == noone || item_prompt == undefined) {
		//show_debug_message("near an item");
		item_prompt = scr_show_prompt(nearby_item, nearby_item.x, nearby_item.y-300);
	}
} 
if (!nearby_item || nearby_npc) {
	scr_dismiss_prompt(item_prompt, 1);
}

// If picking up an item
if (my_state == PLAYER_STATE.PICKINGUP) {
	if (image_index >= image_number - 1) {
		my_state = PLAYER_STATE.CARRYING;
		global.player_control = true;
	}
}

// If putting down an item
if (my_state == PLAYER_STATE.PUTTINGDOWN) {
	// Reset weight
	carry_limit = 0;
	
	// Reset my state once animation finishes
	if (image_index >= image_number - 1) {
		my_state = PLAYER_STATE.IDLE;
		global.player_control = true;
	}
}

// Auto-choose sprite based on state and direction
sprite_index = player_spr[my_state][dir];

// Changes the depth of the player according to its Y position on the room.
depth = -y;