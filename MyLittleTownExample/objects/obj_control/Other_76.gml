/// @description Broadcast Message COntrol

// Listen for Broadcast Messages stored as message on event_data
switch (event_data[? "message"]) {
	case "sequence_start":
		// Set our state
		sequence_state = SEQ_STATE.PLAYING;
		// Find out which sequence just broadcasted this message and mark it
		if (layer_get_element_type(event_data[?  "element_id"]) == layerelementtype_sequence) {
			cur_seq = event_data[? "element_id"];
			show_debug_message("obj_control has heard that Sequence " + string(cur_seq) + " is playing");
		}
		break;
	case "sequence_end":
		sequence_state = SEQ_STATE.FINISHED;
		show_debug_message("obj_control has heard that Sequence " + string(cur_seq) + " has eneded");
		break;
}