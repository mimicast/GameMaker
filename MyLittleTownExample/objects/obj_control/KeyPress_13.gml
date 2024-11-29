/// @description Game Start

// Press Enter to play
if (room == rm_mainTitle) {
	if (global.game_start == false) {
		audio_stop_all();
		global.game_start = true;
		room_goto(rm_gameMain);
	}
}