/// @description Game Variable Initialization

// Game Variables
sequence_state = SEQ_STATE.NOT_PLAYING;
cur_seq_layer = noone;
cur_seq = noone;
town_bgm_volume = audio_sound_get_gain(snd_townBGM);
town_ambience_volume = audio_sound_get_gain(snd_townAmbience);