/// @description OBJ Logic

// Rotate Cloud
image_angle += rot_speed;
y -= drift_speed;

// Fade Out
if (image_alpha > 0) {
	image_alpha -= fade_speed;
}
if (image_alpha <= 0) {
	instance_destroy();
}