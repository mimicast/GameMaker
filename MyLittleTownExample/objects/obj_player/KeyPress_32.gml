/// @description Open Textbox

// Will contain NPC text
var _text, _seq;

if (global.player_control == true) {
	// if near an NPC
	if (nearby_npc) {
		// IF NPC is still available
		if (nearby_npc.my_state == NPC_STATE.NORMAL) {
			// If player does not have an item
			if (has_item == noone || has_item == undefined) {
				_text = nearby_npc.my_text;
		
				if (!instance_exists(obj_gui_textbox)) {
					var _npc_textbox = instance_create_depth(x, y, -10000, obj_gui_textbox);
					_npc_textbox.text_to_show = _text;
				}
			}
		
			// If player has item (and still exists)
			if (has_item != noone && instance_exists(has_item)) {
				// If player has correct item
				if (has_item.object_index == nearby_npc.my_item) {
					_text = nearby_npc.item_text_happy;
					_seq = nearby_npc.sequence_happy;
					// Check if we should remove item, mark NPC
					alarm[1] = 10;
				} else {
					_text = nearby_npc.item_text_sad;
					_seq = nearby_npc.sequence_sad;
				}
		
				if (!instance_exists(obj_gui_textbox)) {
					iii = instance_create_depth(x, y, -10000, obj_gui_textbox);
					iii.text_to_show = _text;
					iii.sequence_to_show = _seq;
				}
			}
		} else if (nearby_npc.my_state == NPC_STATE.DONE) {
			_text = nearby_npc.item_text_done;
		
			if (!instance_exists(obj_gui_textbox)) {
				iii = instance_create_depth(x, y, -10000, obj_gui_textbox);
				iii.text_to_show = _text;
			}
		}
	}

	// If near an item
	if (nearby_item && !nearby_npc) {
		// If player doesn't have an item
		if (has_item == noone || has_item == undefined) {
			global.player_control = false;
			my_state = PLAYER_STATE.PICKINGUP;
			image_index = 0;
			has_item = nearby_item;
		
			// Take into account weight of the item we're picking up
			carry_limit = has_item.item_weight * 0.1;
		
			// Change state of item we're picking up
			with (has_item) {
				my_state = ITEM_STATE.TAKEN;
			}
		
			// Play pickup sound
			audio_play_sound(snd_itemPickup, 1, 0);
		}
	}
	
	// If not near an NPC or another item
	if (!nearby_item && !nearby_npc) {
		// Put down an item
		if (has_item != noone) {
			my_state = PLAYER_STATE.PUTTINGDOWN;
			image_index = 0;
			global.player_control = false;
			// Change state of item we were carrying
			with (has_item) {
				put_down_y = obj_player.y + 5;
				my_state = ITEM_STATE.PUTTING_BACK;
			}
			
			// Play audio
			audio_play_sound(snd_itemPutDown, 1, 0);
			
			// Reset item
			has_item = noone;
		}
	}
}