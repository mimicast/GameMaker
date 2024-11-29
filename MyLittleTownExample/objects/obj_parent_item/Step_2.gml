/// @description 

// Depth sorting and animation
switch my_state {
	// If item is sitting on the ground
	case ITEM_STATE.IDLE: 
		depth = -y;
		break;
	// Get the item location and depth, and apply them when picking it up according to the player's positon.
	case ITEM_STATE.TAKEN:
		var _result = scr_item_position();
		x = _result[0];
		depth = _result[2];
		
		if (instance_exists(obj_player)) {
			// Animate item being picked up
			if (obj_player.my_state == PLAYER_STATE.PICKINGUP) {
				// Wait until third frame of animation
				if (obj_player.image_index >= 2) {
					if (y > _result[1]) {
						y -= pick_up_sp;
					}
				}
			} else {
				y = _result[1];
			}
		}
		break;
	case ITEM_STATE.PUTTING_BACK:
		// Animate item being put down
		if (instance_exists(obj_player) && obj_player.my_state == PLAYER_STATE.PUTTINGDOWN) {
			if (y < put_down_y) {
				y += put_down_sp;
			}
			// Reset item state after being put down
			if (y >= put_down_y) {
				my_state = ITEM_STATE.IDLE;
			}
		}
		break;
}