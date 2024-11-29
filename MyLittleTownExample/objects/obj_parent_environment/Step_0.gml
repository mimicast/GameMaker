/// @description Parent Game Logic

// Changes the depth of the children object according to its Y position on the room.
depth = -y;

// Manage emitter sound for Sequences
if (my_emitter != -1 && useSound != noone && audio_is_playing(useSound)) {
	if (instance_exists(obj_control)) {
		// Duck my sound if a Sequence is playing
		if (obj_control.sequence_state == SEQ_STATE.PLAYING) {
			// Set maximum volume (gain) to 0
			audio_emitter_gain(my_emitter, 0);
		}
		// Restore initial volume (gain) if a sequence isn't playing
		else {
			if (audio_emitter_get_gain(my_emitter) < vol_init) {
				// Reset maximum volume (gain) back to vol_init
				audio_emitter_gain(my_emitter, vol_init);
			}
		}
	}
}