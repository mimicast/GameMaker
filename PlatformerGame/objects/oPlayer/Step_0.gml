/// @description Insert description here
// You can write your code in this editor
ysp += 0.1;
xsp = 0;

if keyboard_check(ord("A")) {
	xsp = -1;
}

if keyboard_check(ord("D")) {
	xsp = +1;
}

if place_meeting(x, y+1, oSolid) {
	ysp = 0;
	
	if keyboard_check(ord("W")) {
		ysp = -2;
	}
}

if place_meeting(x, y, oFlag) {
	room_goto_next();
}

if place_meeting(x, y, oSpike) {
	room_restart();
}

move_and_collide(xsp, ysp, oSolid);