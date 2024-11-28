/// @description Emmiter Initializer

// Emiter variables
my_emitter = 0;

// Create audio emitter, store its ID and set the emiter up
if (useSound != noone) {
	if !audio_is_playing(useSound) {
		my_emitter = audio_emitter_create();
		audio_emitter_position(my_emitter, x, y, 0);
		audio_falloff_set_model(audio_falloff_exponent_distance);
		audio_emitter_falloff(my_emitter, fallStart, maxDist, 1);
		audio_play_sound_on(my_emitter, useSound, 1, 1);
	}
}