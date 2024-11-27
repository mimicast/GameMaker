/// @description 
// Controls the player movement

// Applies forward movement when the UP/W key is held down
if keyboard_check(ord("W"))
{
	motion_add(image_angle, 0.1);
}

// Applies a back movement when the DOWN/S key is held down
if keyboard_check(ord("S"))
{
	motion_add(image_angle, -0.05);
}

// Turns the player to the right when the RIGHT/D key is held down
if keyboard_check(ord("D")) {
	image_angle -= 4;
}

// Turns the player to the left when the LEFT/A key is held down
if keyboard_check(ord("A")) {
	image_angle += 4;
}

// Wraps the player around the room on the horizontal and vertical axis, with a margin of 0.
move_wrap(true, true, 0)

// If the left MB is pressed, it creates a new instance of the bullet object
if mouse_check_button_pressed(mb_left) {
	instance_create_layer(x, y, "Instances", obj_bullet)
}