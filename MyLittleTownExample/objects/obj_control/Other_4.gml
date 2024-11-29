/// @description General Game Control

// Play music based on Room
switch room {
	case rm_mainTitle:
	audio_play_sound(snd_seq_good01_BGM, 1, 1);
		break;
	case rm_gameMain:
		audio_play_sound(snd_townBGM, 1, 1);
		audio_play_sound(snd_townAmbience, 1, 1);
	break;
}

// Mark Sequence Layer
if (layer_exists("Cutscenes")) {
	cur_seq_layer = "Cutscenes";
} else {
	cur_seq_layer = "Instances";
}