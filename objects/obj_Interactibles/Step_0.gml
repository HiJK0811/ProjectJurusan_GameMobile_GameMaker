// if (instance_exists(o_functional_dialogue)) {exit}

if (instance_exists(obj_Player) && distance_to_object(obj_Player) < min_distance_to_player){
	can_interact = true;
	if(keyboard_check_pressed(input_key) || keyboard_check_pressed(vk_enter)){
		// create dialogue
		room_goto(target_minigame);
		obj_gameStates.game_state = GameState.MINIGAME;
	}
}
else{
	can_interact = false;
}