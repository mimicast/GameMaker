/// @description Dust Alarm

// Create a dust cloud at the specific point of the player and only if the player is running.
var _dust_x, _dust_y;
_dust_x = obj_player.x - (vx * 4);
_dust_y = irandom_range(obj_player.y - 10, obj_player.y + 10);

if (running) {
	// Create fust clouds only if moving
	if (vx != 0 || vy != 0) {
		instance_create_depth(_dust_x, _dust_y, depth + 2, obj_dust);
	}
	
	// reset alarm
	alarm[0] = 8 + (1 + carry_limit);
}