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
        
        // FIX: Removed the '- 1' so highest_unlocked can reach 10
        if (global.current_level == global.highest_unlocked && global.highest_unlocked < global.total_levels) {
            global.highest_unlocked += 1;
        }
        
        // Check if this was the final level (Level 10 is index 9)
        if (global.current_level == global.total_levels - 1) {
            game_beaten = true;
			global.logic_gate_completed = true;
        }
    }
}

// 2. Handle Button Clicks AFTER Winning
// Fade Transition
if (level_completed) {
    if (completion_alpha < 1) {
        completion_alpha += 0.05; // The fade speed (0.05 takes about half a second)
    }
}

// We now check if completion_alpha >= 1 so buttons only work when fully visible
if (level_completed && completion_alpha >= 1 && mouse_check_button_pressed(mb_left)) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    var _cx = _gui_w / 2;
    var _cy = _gui_h / 2;
    
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    
    var _btn_left_x1 = _cx - 170;   var _btn_y1 = _cy + 40;
    var _btn_left_x2 = _cx - 10;    var _btn_y2 = _cy + 100;
    
    var _btn_right_x1 = _cx + 10;   var _btn_y1 = _cy + 40;
    var _btn_right_x2 = _cx + 170;  var _btn_y2 = _cy + 100;

    // 1. Check if player clicked MENU (Left Button)
    if (point_in_rectangle(_mx, _my, _btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2)) {
        with (obj_switch) instance_destroy();
        with (obj_logicGate) instance_destroy();
        with (obj_lightBulb) instance_destroy();
        
        instance_create_layer(0, 0, "Instances", obj_menu_logic);
        io_clear(); 
        instance_destroy(); 
    }
    // 2. Check if player clicked RIGHT BUTTON
    else if (point_in_rectangle(_mx, _my, _btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2)) {
        
        if (!game_beaten) {
            // BEHAVIOR: Go to Next Level
            global.current_level += 1; 
            
            with (obj_switch) instance_destroy();
            with (obj_logicGate) instance_destroy();
            with (obj_lightBulb) instance_destroy();
            
            instance_create_layer(0, 0, "Instances", obj_circuitBuilder);
            io_clear(); 
            instance_destroy();
        } else {
            // BEHAVIOR: Return to Main Game
            with (obj_switch) instance_destroy();
            with (obj_logicGate) instance_destroy();
            with (obj_lightBulb) instance_destroy();
            
            io_clear();

            // Reset Global States
            if (instance_exists(obj_gameStates)) {
                obj_gameStates.game_state = GameState.EXPLORE;
            }
            global.transitioning = false;
            
            // Go to the main room 
            room_goto(room_explore_mainRoom); 
            
            // Destroy the builder
            instance_destroy();
        }
    }
}