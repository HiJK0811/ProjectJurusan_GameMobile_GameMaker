// BLOCK INTERACTIONS DURING CUTSCENES
if (instance_exists(obj_cutscene)) {
	can_interact = false;
	exit; 
}

if (instance_exists(obj_Player) && distance_to_object(obj_Player) < min_distance_to_player){
	can_interact = true;
	x_spd = 0;
	y_spd = 0;

	if((keyboard_check_pressed(input_key) || keyboard_check_pressed(input_alt)) && !instance_exists(obj_dialogBox)){
		
		// PRIORITY 1: Tower of Hanoi (Latest Game)
		if (global.hanoi_completed == true && post_hanoi_text_id != "") {
			create_textbox(post_hanoi_text_id); 
		}  
		// PRIORITY 2: Logic Gate Minigame (Late Game)
		else if (global.logic_gate_completed == true && post_logic_text_id != "") {
			create_textbox(post_logic_text_id); 
		}  

		// PRIORITY 3: The Second Cutscene // add the priority above for check cutscene 3, etc
		else if (post_cutscene_check_2 != "" && variable_struct_exists(global.played_cutscenes, post_cutscene_check_2) && post_cutscene_text_id_2 != "") {
			create_textbox(post_cutscene_text_id_2);
		}

		// PRIORITY 4: The First Cutscene 
		else if (post_cutscene_check != "" && variable_struct_exists(global.played_cutscenes, post_cutscene_check) && post_cutscene_text_id != "") {
			create_textbox(post_cutscene_text_id);
		}
		// PRIORITY 5: Default (Early Game)
		else {
			create_textbox(text_id); 
		}
	}
	
} else {
	can_interact = false;
	x_spd = input_x * moveSpeed;
	y_spd = input_y * moveSpeed;
}