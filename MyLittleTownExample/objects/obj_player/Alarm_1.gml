/// @description Item removal

if (has_item != noone && instance_exists(has_item)) {
	// Destroy the item
	with (has_item) {
		instance_destroy();
	}
	// Reset my item variables
	has_item = noone;
	carry_limit = 0;
}

// Mark NPC as Done
if (nearby_npc != noone && instance_exists(nearby_npc)) {
	// Set the NPC as done
	with (nearby_npc) {
		my_state = NPC_STATE.DONE;
	}
}