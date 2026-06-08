var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// Reset index every frame so it doesn't stay highlighted
index = -1; 

for (var i = 0; i < options_max; i++) {
    // Calculate the same coordinates used in the Draw Event
    var _x = _gui_width / 2;
    var _y = (_gui_height / 2) + (i * (height + margin));
    
    // Check if mouse is within the rectangle bounds
	var _m_x = device_mouse_x_to_gui(0);
	var _m_y = device_mouse_y_to_gui(0);

	// Use _m_x and _m_y in your "if" statement instead of mouse_x/y
	if (_m_x > _x - width/2 && _m_x < _x + width/2 &&
		_m_y > _y - height/2 && _m_y < _y + height/2) {
       
        index = i; // Highlight this button
        
        // If we click the left mouse button
        if (mouse_check_button_pressed(mb_left)) {
			audio_play_sound(snd_click_button, 1, false);
					
			switch(i) {
                case 0:
					roomGoToFade(room_explore_mainRoom);
					break;
                case 1: 
					room_goto(room_tutorial); 
					break;
                case 2: 
					if (!instance_exists(obj_fade_quit)) {
						// global.quitting = true;
						fadeToQuit(room, 90, c_black);
					}
					break;
            }
        }
    }
}