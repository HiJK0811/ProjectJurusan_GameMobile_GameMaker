//// Only check if the level isn't already completed
//if (!level_completed) {
//    var _all_bulbs_on = true;
    
//    // Check every bulb in the room
//    with (obj_lightBulb) {
//        if (currentState != logicState.ON) {
//            _all_bulbs_on = false;
//            break; // Stop checking if we find even one OFF bulb
//        }
//    }
    
//    // If they are all ON, trigger the win state!
//    if (_all_bulbs_on && instance_number(obj_lightBulb) > 0) {
//        level_completed = true;
        
//        // Unlock the next level
//        if (global.current_level == global.highest_unlocked && global.highest_unlocked < global.total_levels) {
//            global.highest_unlocked += 1;
//        }
        
//        // Check if it's the final level
//        if (global.current_level == global.total_levels) {
//            game_beaten = true;
//        }
//    }
//}

//// Handle input to return to menu or next level after winning
//if (level_completed && mouse_check_button_pressed(mb_left)) {
    
//    // 1. Destroy all the circuit pieces on the screen
//    with (obj_switch) { instance_destroy(); }
//    with (obj_logicGate) { instance_destroy(); }
//    with (obj_lightBulb) { instance_destroy(); }
    
//    // 2. Bring the menu back onto the screen
//    instance_create_layer(0, 0, "Instances", obj_menu_logic);
    
//    // 3. Destroy the builder itself
//    instance_destroy();
//}

// 1. Check for the Win Condition
if (!level_completed) {
    var _all_bulbs_on = true;
    
    with (obj_lightBulb) {
        if (currentState != logicState.ON) {
            _all_bulbs_on = false;
            break; 
        }
    }
    
    if (_all_bulbs_on && instance_number(obj_lightBulb) > 0) {
        level_completed = true;
        
        // Unlock the next level
        if (global.current_level == global.highest_unlocked && global.highest_unlocked < global.total_levels - 1) {
            global.highest_unlocked += 1;
        }
        
        // Check if this was the final level
        if (global.current_level == global.total_levels - 1) {
            game_beaten = true;
        }
    }
}

// 2. Handle Button Clicks AFTER Winning
if (level_completed && mouse_check_button_pressed(mb_left)) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    var _cx = _gui_w / 2;
    var _cy = _gui_h / 2;
    
    // Crucial: Track the mouse on the GUI layer!
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    
    var _menu_x1 = _cx - 160;   var _menu_y1 = _cy + 40;
    var _menu_x2 = _cx - 20;    var _menu_y2 = _cy + 100;
    
    var _next_x1 = _cx + 20;    var _next_y1 = _cy + 40;
    var _next_x2 = _cx + 160;   var _next_y2 = _cy + 100;

    // Check if player clicked MENU
    if (point_in_rectangle(_mx, _my, _menu_x1, _menu_y1, _menu_x2, _menu_y2)) {
        // Destroy level pieces
        with (obj_switch) instance_destroy();
        with (obj_logicGate) instance_destroy();
        with (obj_lightBulb) instance_destroy();
        
        // Spawn Menu
        instance_create_layer(0, 0, "Instances", obj_menu_logic);
        
        io_clear(); // <--- THE MAGIC FIX: Clears the click for the rest of the frame
        
        instance_destroy(); 
    }
    // Check if player clicked NEXT LEVEL
    else if (!game_beaten && point_in_rectangle(_mx, _my, _next_x1, _next_y1, _next_x2, _next_y2)) {
        global.current_level += 1; 
        
        // Destroy old level pieces
        with (obj_switch) instance_destroy();
        with (obj_logicGate) instance_destroy();
        with (obj_lightBulb) instance_destroy();
        
        // Spawn a brand new builder
        instance_create_layer(0, 0, "Instances", obj_circuitBuilder);
        
        io_clear(); // <--- THE MAGIC FIX: Clears the click for the rest of the frame
        
        instance_destroy();
    }
}