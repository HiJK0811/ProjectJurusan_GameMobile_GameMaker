// if (instance_exists(o_functional_dialogue)) {exit}

if (instance_exists(obj_player) && distance_to_object(obj_player) < min_distance_to_player){
	can_interact = true;
	
	if (!popup_played) {
        audio_play_sound(snd_pop_up, 0, false);
        popup_played = true;
    }
	
	if(keyboard_check_pressed(input_key) || mouse_check_button_pressed(mb_left) /* || keyboard_check_pressed(alt_key) */ ){
		// create dialogue
		room_goto(target_minigame);
		o_game.game_state = GameState.MINIGAME;
	}
}
else{
	can_interact = false;
	popup_played = false;
}