//depth = 10;

//with (obj_switch){
//    for (var i = 0; i < array_length(outputsTo); i++){
//        var target = outputsTo[i];
//        if (currentState == logicState.ON){
//            draw_set_color(c_lime);
//		}
//        else{
//            draw_set_color(c_gray);
//		}
//        draw_line_width(x, y, target.x, target.y, 2);
//    }
//}

//with (obj_logicGate){
//    for (var i = 0; i < array_length(outputsTo); i++){
//        var target = outputsTo[i];

//        if (currentState == logicState.ON){
//            draw_set_color(c_lime);
//		}
//        else{
//            draw_set_color(c_gray);
//		}
//        draw_line_width(x, y, target.x, target.y, 2);
//    }
//}

//if (level_completed) {
//    var _cx = room_width / 2;
//    var _cy = room_height / 2;

//    // 1. Draw a dark semi-transparent overlay over the whole screen
//    draw_set_alpha(0.8);
//    draw_set_color(c_black);
//    draw_rectangle(0, 0, room_width, room_height, false);
//    draw_set_alpha(1.0);

//    // Set text alignment to center
//    draw_set_halign(fa_center);
//    draw_set_valign(fa_middle);

//    // 2. Draw the Win Text
//    if (game_beaten) {
//        draw_set_color(c_yellow);
//        draw_text_transformed(_cx, _cy - 60, "LOGIC MASTER!", 2, 2, 0);
//        draw_set_color(c_white);
//        draw_text(_cx, _cy - 20, "You completed all 10 levels!");
//    } else {
//        draw_set_color(c_lime);
//        draw_text_transformed(_cx, _cy - 60, "LEVEL COMPLETE!", 2, 2, 0);
        
//        var _levels_left = global.total_levels - (global.current_level + 1);
//        draw_set_color(c_white);
//        draw_text(_cx, _cy - 20, string(_levels_left) + " levels to go!");
//    }

//    // 3. Draw the Buttons
//    // Menu Button
//    var _menu_x1 = _cx - 160;   var _menu_y1 = _cy + 40;
//    var _menu_x2 = _cx - 20;    var _menu_y2 = _cy + 100;
    
//    // Hover effect for Menu
//    if (point_in_rectangle(mouse_x, mouse_y, _menu_x1, _menu_y1, _menu_x2, _menu_y2)) {
//        draw_set_color(c_silver);
//    } else {
//        draw_set_color(c_dkgray);
//    }
//    draw_rectangle(_menu_x1, _menu_y1, _menu_x2, _menu_y2, false);
//    draw_set_color(c_white);
//    draw_rectangle(_menu_x1, _menu_y1, _menu_x2, _menu_y2, true);
//    draw_text(_cx - 90, _cy + 70, "Menu");

//    // Next Level Button (Only draw if game isn't fully beaten)
//    if (!game_beaten) {
//        var _next_x1 = _cx + 20;    var _next_y1 = _cy + 40;
//        var _next_x2 = _cx + 160;   var _next_y2 = _cy + 100;
        
//        // Hover effect for Next Level
//        if (point_in_rectangle(mouse_x, mouse_y, _next_x1, _next_y1, _next_x2, _next_y2)) {
//            draw_set_color(c_lime);
//        } else {
//            draw_set_color(c_green);
//        }
//        draw_rectangle(_next_x1, _next_y1, _next_x2, _next_y2, false);
//        draw_set_color(c_white);
//        draw_rectangle(_next_x1, _next_y1, _next_x2, _next_y2, true);
//        draw_text(_cx + 90, _cy + 70, "Next Level");
//    }

//    // Reset alignment
//    draw_set_halign(fa_left);
//    draw_set_valign(fa_top);
//}

// --- DRAW EVENT (ONLY this code stays here) ---
depth = 10;

with (obj_switch) {
    for (var i = 0; i < array_length(outputsTo); i++) {
        var target = outputsTo[i];
        if (currentState == logicState.ON) draw_set_color(c_lime);
        else draw_set_color(c_gray);
        draw_line_width(x, y, target.x, target.y, 2);
    }
}

with (obj_logicGate) {
    for (var i = 0; i < array_length(outputsTo); i++) {
        var target = outputsTo[i];
        if (currentState == logicState.ON) draw_set_color(c_lime);
        else draw_set_color(c_gray);
        draw_line_width(x, y, target.x, target.y, 2);
    }
}