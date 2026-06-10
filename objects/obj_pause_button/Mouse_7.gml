switch(button_id) {
	case 1: // Resume
		obj_pause.paused = false;
		obj_pause.update_pause();
		break;
		
	case 2: // Tutorial
		layer_set_visible("PauseLayer", false);
		layer_set_visible("TutorialLayer", true);
		break;
	
	case 3: // Return to Main Menu
		fadeToRoom(target_room, 60, c_black);
		layer_set_visible(layer_name, false);
		// audio_stop_sound(snd_play);
		
		break;
		
	case 4: // Quit Game
		// global.quitting = true;
		fadeToQuit(room, 90, c_black);
		layer_set_visible(layer_name, false);
		break;
		
	case 5: // Back Button
		layer_set_visible("PauseLayer", true);
		layer_set_visible("TutorialLayer", false);
		break;
}

