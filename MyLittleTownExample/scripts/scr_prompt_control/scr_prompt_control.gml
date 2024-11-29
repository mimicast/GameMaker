// Handles the control of the GUI prompts then approaching NPCs or items on the ground

// Shows the GUI prompt on top of NPCs and items when a collision is made.
function scr_show_prompt(_object, _x, _y){
	if (instance_exists(_object)) {
		if(!instance_exists(obj_gui_textbox) && !instance_exists(obj_gui_prompt)) {
			// We check if the state of the player is not PUTTINGDOWN, otherwise it might bring up the GUI prompt.
			if (obj_player.my_state != PLAYER_STATE.PUTTINGDOWN) {	
				var _iii = instance_create_depth(_x, _y, -10000, obj_gui_prompt);
				return _iii;
			}
		}
	}
}

// Dismiss the GUI prompt when not colliding with the NPCs or items.
function scr_dismiss_prompt(_which_prompt, _to_reset) {
	if (_which_prompt != undefined) {
		if (instance_exists(_which_prompt)) {
			// Tell the prompt to fade out
			with (_which_prompt) {
				fade_me = "fadeOut";
			}
			// Reset prompt variable
			if (instance_exists(obj_player)) {
				with (obj_player) {
					switch _to_reset {
						// Reset npc_prompt
						case 0:
							npc_prompt = noone;
							break;
						case 1: 
							item_prompt = noone;
							break;
					}
				}
			}
		}
	}
}