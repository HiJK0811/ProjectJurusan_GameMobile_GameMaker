if (instance_exists(obj_Player) && distance_to_object(obj_Player) < min_distance_to_player){
	can_interact = true;
	if((keyboard_check_pressed(input_key) || keyboard_check_pressed(input_alt)) && !instance_exists(obj_dialogBox)){
		// create dialogue
		create_textbox(text_id)
	}
}
else{
	can_interact = false;
}