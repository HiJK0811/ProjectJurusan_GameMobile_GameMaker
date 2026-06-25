//var _gui_width = display_get_gui_width();
//var _gui_height = display_get_gui_height();

//// Reset index every frame so it doesn't stay highlighted
//index = -1; 

//for (var i = 0; i < options_max; i++) {
//    // Calculate the same coordinates used in the Draw Event
//    var _x = _gui_width / 2;
//    var _y = (_gui_height / 2) + (i * (height + margin));
    
//    // Check if mouse is within the rectangle bounds
//	var _m_x = device_mouse_x_to_gui(0);
//	var _m_y = device_mouse_y_to_gui(0);

//	// Use _m_x and _m_y in your "if" statement instead of mouse_x/y
//	if (_m_x > _x - width/2 && _m_x < _x + width/2 &&
//		_m_y > _y - height/2 && _m_y < _y + height/2) {
       
//        index = i; // Highlight this button
        
//        // If we click the left mouse button
//        if (mouse_check_button_pressed(mb_left)) {
//			audio_play_sound(snd_click_button, 1, false);
					
//			switch(i) {
//                case 0:
//					roomGoToFade(room_explore_mainRoom);
//					break;
//                case 1: 
//					room_goto(room_tutorial); 
//					break;
//                case 2: 
//					if (!instance_exists(obj_fade_quit)) {
//						// global.quitting = true;
//						fadeToQuit(room, 90, c_black);
//					}
//					break;
//            }
//        }
//    }
//}

var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// ==========================================
// 1. KEYBOARD NAVIGATION
// ==========================================
var _up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

if (_up) {
    index--;
    if (index < 0) index = options_max - 1; // Wrap around to bottom
}

if (_down) {
    index++;
    if (index >= options_max) index = 0; // Wrap around to top
}


// ==========================================
// 2. MOUSE NAVIGATION
// ==========================================
var _m_x = device_mouse_x_to_gui(0);
var _m_y = device_mouse_y_to_gui(0);

// Check if the mouse actually moved this frame
var _mouse_moved = (_m_x != last_mouse_x || _m_y != last_mouse_y);
last_mouse_x = _m_x; // Update for the next frame
last_mouse_y = _m_y;

for (var i = 0; i < options_max; i++) {
    var _x = _gui_width / 2;
    var _y = (_gui_height / 2) + (i * (height + margin));
    
    // Check if mouse is hovering over a button
    if (_m_x > _x - width/2 && _m_x < _x + width/2 &&
        _m_y > _y - height/2 && _m_y < _y + height/2) {
        
        // Only let the mouse hijack the selection if it moved
        if (_mouse_moved) {
            index = i; 
        }
        
        // If left clicked while hovering, trigger the selection
        if (mouse_check_button_pressed(mb_left)) {
            index = i;     // Ensure we select what we clicked
            _select = true; // Trigger the switch statement below
        }
    }
}


// ==========================================
// 3. EXECUTE SELECTION
// ==========================================
if (_select) {
    audio_play_sound(snd_click_button, 1, false);
            
    switch(index) {
        case 0: // Start
            roomGoToFade(room_explore_mainRoom);
            break;
        case 1: // Tutorial
			room_goto(room_tutorial)
            layer_set_visible("TutorialLayer_Main", true);
            break;
        case 2: // Quit Game
            if (!instance_exists(obj_fade_quit)) {
                // global.quitting = true;
                fadeToQuit(room, 90, c_black);
            }
            break;
    }
}