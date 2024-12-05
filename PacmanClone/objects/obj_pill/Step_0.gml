/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_dot) {
	//show_debug_message("There are still dots around");
	object_set_visible(obj_pill, false);
	visible = false;
} else {
	//show_debug_message("There are no more dots around");
	object_set_visible(obj_pill, true);
	visible = true;
}