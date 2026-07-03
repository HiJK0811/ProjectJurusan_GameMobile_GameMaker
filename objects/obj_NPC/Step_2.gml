if (instance_exists(obj_Player) && distance_to_object(obj_Player) < min_distance_to_player){
	can_interact = true;
	x_spd = 0;
	y_spd = 0;

	if((keyboard_check_pressed(input_key) || keyboard_check_pressed(input_alt)) && !instance_exists(obj_dialogBox)){
		
		
		//// DEBUG
		//// --- THE DEBUG TEST ---
		//show_debug_message("=== NPC INTERACTION DEBUG ===");
		//show_debug_message("1. Lylia is looking for cutscene: " + string(post_cutscene_check));
		//show_debug_message("2. Does the global memory have this cutscene saved? " + string(variable_struct_exists(global.played_cutscenes, post_cutscene_check)));
		//show_debug_message("=============================");
		//// ----------------------
		
		// PRIORITY 1: Minigame (Late Game)
		if (global.logic_gate_completed == true && post_logic_text_id != "") {
			create_textbox(post_logic_text_id); 
		}  
		// PRIORITY 2: Cutscene (Mid Game)
		else if (post_cutscene_check != "" && variable_struct_exists(global.played_cutscenes, post_cutscene_check) && post_cutscene_text_id != "") {
			create_textbox(post_cutscene_text_id);
		}
		// PRIORITY 3: Default (Early Game)
		else {
			create_textbox(text_id); 
		}
	}
	
} else {
	can_interact = false;
	x_spd = input_x * moveSpeed;
	y_spd = input_y * moveSpeed;
}