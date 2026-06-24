if (keyboard_check_pressed(vk_escape)) {
	layer_set_visible("TutorialLayer", false);
	
	room_goto(room_a_mainMenu)

}

// room_goto(room_a_mainMenu)