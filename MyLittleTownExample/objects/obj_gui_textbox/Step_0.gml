/// @description Display Textbox


switch fade_me {
	// Increase the fade effect as long as its alpha is less than 0, and it stops once it reaches 1.
	case 0:
		if (image_alpha < 1) {
			image_alpha += fade_speed;
		}
		if (image_alpha == 1) {
			fade_me = 1;
		}
		break;
	// Decrease the fade effect as long as its alpha is more than 0, and it stops once it reaches 0, 
	// as well as queues up its destruction.
	case 2:
		if (image_alpha > 0) {
			image_alpha -= fade_speed;
		}
		if (image_alpha == 0) {
			fade_me = 3;
			// Queue up destroy
			alarm[0] = 2;
		}
		break;
}