/// @description Player Controls

if global.player_control {
	move_up = keyboard_check(ord("W"));
	move_down = keyboard_check(ord("S"));
	move_left = keyboard_check(ord("A"));
	move_right = keyboard_check(ord("D"));
}
vx = (move_right - move_left) * player_speed;
vy = (move_down - move_up) * player_speed;

if (vx != 0 || vy != 0) {
	image_speed = 1;
	// Stops pacman from moving outside the labyrinth
	if !place_meeting(x + vx, y, obj_wall) {
		x += vx;	
	}
	if !place_meeting(x, y + vy, obj_wall) {
		y += vy;	
	}
	
	// Changes the sprite direction according to where pacman last moved.
	// This order ensures that you cannot overlap an up/down animation
	// with a left and right movement.
	if (vy > 0) {
		dir = 3; // down
	}
	if (vy < 0) {
		dir = 2; // up
	}
	if (vx < 0) {
		dir = 1; // left
	}
	if (vx > 0) {
		dir = 0; // right
	}
} else {
	image_speed = 0;
	image_index = 0;
}

// Changes the sprite direction according to where the sprite is looking
switch dir {
	case 0: 
		if (image_angle != 0) {
			image_angle = 0;
		}
		image_xscale = 0.18;
		image_yscale = 0.18;
		break;
	case 1: 
		if (image_angle != 0) {
			image_angle = 0;
		}
		image_xscale = -0.18;
		image_yscale = -0.18;
		break;
	case 2: 
		if (image_xscale < 0) {
			image_angle = -90;
		} else {
			image_angle = 90;
		}
		break;
	case 3: 
		if (image_xscale > 0) {
			image_angle = -90;
		} else {			
			image_angle = 90;
		}
		break;
}

move_wrap(true, true, 10);