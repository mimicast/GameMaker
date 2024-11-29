/// @description NPC Game Logic

// Random loop timing for npc . It basically stops the animation speed at the last frame of the animation
// and sets an alarm with a random number from the set variable range.


// Change appearance with state
switch my_state {
	case NPC_STATE.NORMAL: 
		if (image_speed > 0) {
			if (image_index == image_number - 1) {
				image_speed = 0;
				alarm[0] = irandom_range(loopRange01, loopRange02);
			}
		}		
		break;
	case NPC_STATE.DONE:
		if (done_sprite != noone && sprite_index != done_sprite) {
			sprite_index = done_sprite;
		}
		break;
}



// depth sorting for NPC sprites
depth = -y;

