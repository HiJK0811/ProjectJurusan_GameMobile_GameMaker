// --- DRAW GUI EVENT ---
if (level_completed) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    var _cx = _gui_w / 2;
    var _cy = _gui_h / 2;
    
    // Get exact mouse position on the UI layer
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);

    // 1. Draw overlay
    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gui_w, _gui_h, false);
    draw_set_alpha(1.0);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // 2. Draw Text (Moved higher up to not cover the logic gates)
    if (game_beaten) {
        draw_set_color(c_yellow);
        draw_text_transformed(_cx, _cy - 120, "LOGIC MASTER!", 2, 2, 0);
        draw_set_color(c_white);
        draw_text(_cx, _cy - 80, "You completed all 10 levels!");
    } else {
        draw_set_color(c_lime);
        draw_text_transformed(_cx, _cy - 120, "LEVEL COMPLETE!", 2, 2, 0);
        var _levels_left = global.total_levels - (global.current_level + 1);
        draw_set_color(c_white);
        draw_text(_cx, _cy - 80, string(_levels_left) + " levels to go!");
    }

    // 3. Draw Buttons
    var _menu_x1 = _cx - 160;   var _menu_y1 = _cy + 40;
    var _menu_x2 = _cx - 20;    var _menu_y2 = _cy + 100;
    
    if (point_in_rectangle(_mx, _my, _menu_x1, _menu_y1, _menu_x2, _menu_y2)) {
        draw_set_color(c_silver);
    } else {
        draw_set_color(c_dkgray);
    }
    draw_rectangle(_menu_x1, _menu_y1, _menu_x2, _menu_y2, false);
    draw_set_color(c_white);
    draw_rectangle(_menu_x1, _menu_y1, _menu_x2, _menu_y2, true);
    draw_text(_cx - 90, _cy + 70, "Menu");

    if (!game_beaten) {
        var _next_x1 = _cx + 20;    var _next_y1 = _cy + 40;
        var _next_x2 = _cx + 160;   var _next_y2 = _cy + 100;
        
        if (point_in_rectangle(_mx, _my, _next_x1, _next_y1, _next_x2, _next_y2)) {
            draw_set_color(c_lime);
        } else {
            draw_set_color(c_green);
        }
        draw_rectangle(_next_x1, _next_y1, _next_x2, _next_y2, false);
        draw_set_color(c_white);
        draw_rectangle(_next_x1, _next_y1, _next_x2, _next_y2, true);
        draw_text(_cx + 90, _cy + 70, "Next Level");
    }

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}