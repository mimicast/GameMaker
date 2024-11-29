/// @description Destroy textbox

// Return control to player if no sequence to load
if (sequence_to_show == noone) {
	global.player_control = true;
}

// Create sequence if appropiate
if (sequence_to_show != noone) {
	// Play NPC Sequence
	scr_play_sequence(sequence_to_show);
}

// Destroys the textbox
instance_destroy();