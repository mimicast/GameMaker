/// @description Game Logic

// Control Sequences
switch sequence_state {
	case SEQ_STATE.PLAYING:
		// Turn down audio volume
		if (audio_is_playing(snd_townBGM)) {
			audio_sound_gain(snd_townBGM, 0, 60);
		}
		if (audio_is_playing(snd_townAmbience)) {
			audio_sound_gain(snd_townAmbience, 0, 60);
		}
		global.player_control = false;
		break;
	case SEQ_STATE.FINISHED:
		if (layer_sequence_exists(cur_seq_layer, cur_seq)) {
			layer_sequence_destroy(cur_seq);
		}
		global.player_control = true;
		sequence_state = SEQ_STATE.NOT_PLAYING;
		cur_seq = noone;
		
		// Turn up audio volume
		if (audio_is_playing(snd_townBGM) && audio_sound_get_gain(snd_townBGM) < town_bgm_volume) {
			audio_sound_gain(snd_townBGM, town_bgm_volume, 60);
		}
		if (audio_is_playing(snd_townAmbience) && audio_sound_get_gain(snd_townAmbience) < town_ambience_volume) {
			audio_sound_gain(snd_townAmbience, town_ambience_volume, 60);
		}
		
		// Check if NPCs are "DONE"
		if (global.game_over == false) {
			if (instance_exists(obj_npc_baker) && instance_exists(obj_npc_teacher) && instance_exists(obj_npc_grocer)) {
				if (obj_npc_baker.my_state == NPC_STATE.DONE && obj_npc_teacher.my_state == NPC_STATE.DONE && obj_npc_grocer.my_state == NPC_STATE.DONE) {
					// Queue up "Game Over" sequence
					global.player_control = false;
					alarm[0] = 60;
					// Mark game as won
					global.game_over = true;
				}
			}
		}
		break;
}