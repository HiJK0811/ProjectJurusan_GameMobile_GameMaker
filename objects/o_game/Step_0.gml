//// DEBUG
//if (keyboard_check_pressed(ord("P"))){
//	show_debug_message("Changed game state from " + string(game_state) + "to EXPLORE");
//	game_state = GameState.EXPLORE;
//}
//else if (keyboard_check_pressed(ord("O"))) {
//	show_debug_message("Changed game state from " + string(game_state) + "to MINIGAME");
//	game_state = GameState.MINIGAME;
//}

//if (game_state == GameState.EXPLORE){
//	if (keyboard_check_pressed(ord("L"))) {
//		show_debug_message("Go To Lounge");
//		room_goto(room_explore_mainRoom);
//	}
//	else if (keyboard_check_pressed(ord("K"))) {
//		show_debug_message("Go To Office");	
//		room_goto(room_explore_office);
//	}
//}

//if (game_state == GameState.MINIGAME){
//	if (keyboard_check_pressed(ord("M"))) {
//		show_debug_message("Go To Logic Gates");
//		room_goto(room_minigame_logicGates);
//	}
//	else if (keyboard_check_pressed(ord("B"))) {
//		show_debug_message("Go To Graph");	
//		room_goto(room_minigame_graph);
//	}
//}