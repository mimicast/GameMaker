/// @description 

// Bob up and down 
y += shift;

// Fade effect
switch fade_me {
	case "fadeIn":
		if (image_alpha < 1) {
			image_alpha += fade_speed;
		}
		if (image_alpha >= 1) {
			fade_me = "fadeVisible";
		}
	break;
	case "fadeOut":
		if (image_alpha > 0) {
			image_alpha -= fade_speed;
		}
		if (image_alpha <= 0) {
			fade_me = "fadeDone";
			alarm[0] = 2; // Queue destroy
		}
	break;
}