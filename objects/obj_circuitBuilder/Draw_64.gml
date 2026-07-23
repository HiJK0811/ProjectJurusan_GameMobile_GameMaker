//// --- DRAW GUI EVENT ---
//if (level_completed) {
//    var _gui_w = display_get_gui_width();
//    var _gui_h = display_get_gui_height();
//    var _cx = _gui_w / 2;
//    var _cy = _gui_h / 2;
    
//    // Get exact mouse position on the UI layer
//    var _mx = device_mouse_x_to_gui(0);
//    var _my = device_mouse_y_to_gui(0);

//    // 1. Draw overlay
//    draw_set_alpha(0.85);
//    draw_set_color(c_black);
//    draw_rectangle(0, 0, _gui_w, _gui_h, false);
//    draw_set_alpha(1.0);

//    draw_set_halign(fa_center);
//    draw_set_valign(fa_middle);

//    // 2. Draw Text (Moved higher up to not cover the logic gates)
//    if (game_beaten) {
//        draw_set_color(c_yellow);
//        draw_text_transformed(_cx, _cy - 120, "Mission Complete", 2, 2, 0);
//        draw_set_color(c_white);
//        draw_text(_cx, _cy - 80, "You completed all 10 levels!");
//    } else {
//        draw_set_color(c_lime);
//        draw_text_transformed(_cx, _cy - 120, "LEVEL COMPLETE!", 2, 2, 0);
//        var _levels_left = global.total_levels - (global.current_level + 1);
//        draw_set_color(c_white);
//        draw_text(_cx, _cy - 80, string(_levels_left) + " levels to go!");
//    }

//    // 3. Draw Buttons
//    // I widened the boxes slightly to 160px so the new text fits perfectly
//    var _btn_left_x1 = _cx - 170;   var _btn_y1 = _cy + 40;
//    var _btn_left_x2 = _cx - 10;    var _btn_y2 = _cy + 100;
    
//    var _btn_right_x1 = _cx + 10;   var _btn_y1 = _cy + 40;
//    var _btn_right_x2 = _cx + 170;  var _btn_y2 = _cy + 100;

//    // --- DRAW LEFT BUTTON (Always Menu) ---
//    if (point_in_rectangle(_mx, _my, _btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2)) {
//        draw_set_color(c_silver);
//    } else {
//        draw_set_color(c_dkgray);
//    }
//    draw_rectangle(_btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2, false);
//    draw_set_color(c_white);
//    draw_rectangle(_btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2, true);
//    draw_text(_btn_left_x1 + 80, _cy + 70, "Menu");

//    // --- DRAW RIGHT BUTTON (Dynamic) ---
//    if (!game_beaten) {
//        // State: Next Level
//        if (point_in_rectangle(_mx, _my, _btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2)) {
//            draw_set_color(c_lime);
//        } else {
//            draw_set_color(c_green);
//        }
//        draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, false);
//        draw_set_color(c_white);
//        draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, true);
//        draw_text(_btn_right_x1 + 80, _cy + 70, "Next Level");
//    } else {
//        // State: Return to Game (Game is beaten!)
//        if (point_in_rectangle(_mx, _my, _btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2)) {
//            draw_set_color(c_aqua); // Nice blue hover effect
//        } else {
//            draw_set_color(c_teal); // Dark blue idle effect
//        }
//        draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, false);
//        draw_set_color(c_white);
//        draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, true);
//        draw_text(_btn_right_x1 + 80, _cy + 70, "Return to Game");
//    }

//    // Reset alignment
//    draw_set_halign(fa_left);
//    draw_set_valign(fa_top);
//}

// --- DRAW MOVE COUNTER ---
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// The '1.5, 1.5' scales the text to be 50% larger. Change to '2, 2' if you want it huge!
draw_text_transformed(20, 20, "Moves: " + string(moves_made), 2, 2, 0);

if (level_completed) {
    // --- APPLY FADE IN ---
    draw_set_alpha(completion_alpha);

    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    var _cx = _gui_w / 2;
    var _cy = _gui_h / 2;
	
	var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);

    // 1. Draw Screen Dimming Overlay
    draw_set_color(c_black);
    // Multiplying by 0.7 keeps the background semi-transparent even when fully faded in
    draw_set_alpha(completion_alpha * 0.7); 
    draw_rectangle(0, 0, _gui_w, _gui_h, false);
    
    // Reset alpha back to normal for the UI elements
    draw_set_alpha(completion_alpha);

    // 2. Draw "Level Complete" Text
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(_cx, _cy - 50, "LEVEL COMPLETE!", 2, 2, 0);
	
    if (!game_beaten) {
        draw_set_color(c_white);
        var _levels_left = global.total_levels - (global.current_level + 1);
        
        if (_levels_left == 1) {
            draw_text(_cx, _cy - 10, "1 level to go!");
        } else {
            draw_text(_cx, _cy - 10, string(_levels_left) + " levels to go!");
        }
    } else {
        // Optional: A nice message for when they beat the final level!
        draw_set_color(c_white);
        draw_text(_cx, _cy - 10, "All levels completed!");
    }

    // 3. Draw Buttons
    var _btn_left_x1 = _cx - 170;   var _btn_y1 = _cy + 40;
    var _btn_left_x2 = _cx - 10;    var _btn_y2 = _cy + 100;
    
    var _btn_right_x1 = _cx + 10;   var _btn_y1 = _cy + 40;
    var _btn_right_x2 = _cx + 170;  var _btn_y2 = _cy + 100;

    // --- DRAW LEFT BUTTON (Always Menu) ---
    if (point_in_rectangle(_mx, _my, _btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2)) {
        draw_set_color(c_silver);
    } else {
        draw_set_color(c_dkgray);
    }
    draw_rectangle(_btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2, false);
    draw_set_color(c_white);
    draw_rectangle(_btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2, true);
    draw_text(_btn_left_x1 + 80, _cy + 70, "Menu");

    // --- DRAW RIGHT BUTTON (Dynamic) ---
    if (!game_beaten) {
        if (point_in_rectangle(_mx, _my, _btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2)) {
            draw_set_color(c_lime);
        } else {
            draw_set_color(c_green);
        }
        draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, false);
        draw_set_color(c_white);
        draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, true);
        draw_text(_btn_right_x1 + 80, _cy + 70, "Next Level");
    } else {
        if (point_in_rectangle(_mx, _my, _btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2)) {
            draw_set_color(c_aqua); 
        } else {
            draw_set_color(c_teal); 
        }
        draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, false);
        draw_set_color(c_white);
        draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, true);
        draw_text(_btn_right_x1 + 80, _cy + 70, "Return to Game");
    }

    // Reset alignment and lock alpha back to 1.0 so it doesn't break the rest of the game's drawing
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1.0);
}