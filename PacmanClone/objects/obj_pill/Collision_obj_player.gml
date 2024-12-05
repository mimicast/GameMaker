/// @description Insert description here
// You can write your code in this editor
// If pacman collides with a dot, remove it

if object_get_visible(obj_pill) {
	audio_play_sound(snd_fright, 1, false);
	instance_destroy();
	global.player_control = false;
	global.game_over = true;
	if (!audio_is_playing(snd_fright)) {
		alarm[0] = true;
	}
}