if (instance_exists(obj_Player) && distance_to_object(obj_Player) < min_distance_to_player){
	can_interact = true;
	x_spd = 0;
	y_spd = 0;
	if((keyboard_check_pressed(input_key) || keyboard_check_pressed(input_alt)) && !instance_exists(obj_dialogBox)){
		// create dialogue
		create_textbox(text_id)
		if (global.logic_gate_completed == true) {
			// Trigger the post-minigame dialogue
			create_textbox("Lylia_post_logic"); 
		} else {
			// Trigger the default dialogue from the Creation Code
			create_textbox(text_id); 
		}
	}
}
else{
	can_interact = false;
	x_spd = input_x * moveSpeed;
	y_spd = input_y * moveSpeed;
}
