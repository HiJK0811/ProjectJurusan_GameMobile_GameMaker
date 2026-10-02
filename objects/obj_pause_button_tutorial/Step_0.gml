// 1. Prevent action if the tutorial is not currently visible/active
// (Adjust this check based on how your tutorial room/layer is set up)
if (!layer_get_visible("TutorialLayer_Main")) exit;

var _select = false;

// 2. Mouse Hover & Click Logic
if (position_meeting(mouse_x, mouse_y, id)) {
    image_alpha = 0.5; // Highlight when hovered
    
    // If clicked
    if (mouse_check_button_pressed(mb_left)) {
        _select = true;
    }
} else {
    image_alpha = 1.0; // Reset to normal when not hovered
}

// 3. Keyboard Logic
// Let the player press Escape, Backspace, or Enter to leave the tutorial
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_enter)) {
    _select = true;
}

// 4. Execute Action
if (_select) {
    // Optional: Add your button click sound here!
    // audio_play_sound(snd_click_button, 1, false);
	
	if (!audio_is_playing(snd_close_button)) {
		audio_play_sound(snd_close_button, 0, false);
	}
    
    layer_set_visible("TutorialLayer_Main", false);
    room_goto(room_a_mainMenu); 
}