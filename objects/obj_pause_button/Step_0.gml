if (window_get_width() != win_w || window_get_height() != win_h) {
	display_set_gui_maximise();
}

// 1. Maintain GUI maximization
if (window_get_width() != win_w || window_get_height() != win_h) {
    display_set_gui_maximise();
    win_w = window_get_width();
    win_h = window_get_height();
}

// 2. Prevent invisible buttons from doing anything
var _is_active_layer = false;
if (button_id <= 4 && layer_get_visible("PauseLayer")) _is_active_layer = true;
if (button_id == 5 && layer_get_visible("TutorialLayer")) _is_active_layer = true;

if (!_is_active_layer) exit;

// 3. Mouse Hover Logic
var _hovered = position_meeting(mouse_x, mouse_y, id);
var _select = false;

if (_hovered) {
    // If the mouse moved, hijack the selection
    if (obj_pause.mouse_moved) {
        obj_pause.menu_index = button_id; 
    }
    
    // If clicked, trigger the selection
    if (mouse_check_button_pressed(mb_left)) {
        obj_pause.menu_index = button_id;
        _select = true;
    }
}

// 4. Keyboard Selection Logic
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    _select = true;
}

// 5. Visual Feedback & Execution
if (obj_pause.menu_index == button_id) {
    image_alpha = 0.5; // Highlight this button
    
    if (_select) {
        // Execute the action for this specific button
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
                // Reset index back to Tutorial button when returning
                obj_pause.menu_index = 2; 
                break;
        }
    }
} else {
    image_alpha = 1.0; // Not highlighted
}