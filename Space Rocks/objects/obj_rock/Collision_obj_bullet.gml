/// @description Collision event
// Events that include collision with the bullet

// In order: Destroys the bullet, creates an explosion effect and sets the direction of the rock to a new random direction

instance_destroy(other);
effect_create_above(ef_explosion, x, y, 1, c_white);

direction = random(360);

// Checks if the rock is big, and changes it into a small rock
if sprite_index == spr_rock_big {
	sprite_index = spr_rock_small;
	instance_copy(true);
} // Checks if the current number of rocks is less than 12, in which case it will spawn a new one outside of the room
else if instance_number(obj_rock) < 12 {
	sprite_index = spr_rock_big;
	x = -100;
} // If the rock is small, it will destroy its instance.
else {
	instance_destroy();
}

// Adds 50 to the points variable to keep the score.
obj_game.points += 50;