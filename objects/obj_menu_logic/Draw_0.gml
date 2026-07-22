//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);

//for (var i = 0; i < global.total_levels; i++) {
//    // Calculate grid position
//    var _col = i % 5;
//    var _row = floor(i / 5);
    
//    var _x1 = start_x + (_col * (box_width + padding));
//    var _y1 = start_y + (_row * (box_height + padding));
//    var _x2 = _x1 + box_width;
//    var _y2 = _y1 + box_height;
    
//    var _level_num = i + 1;
    
//    // --- THE NEW LOGIC MATH ---
//    // Compare 'i' directly to highest_unlocked
//    var _is_completed = (i < global.highest_unlocked);
//    var _is_unlocked = (i <= global.highest_unlocked);
    
//    // 1. Draw Button Background
//    if (_is_completed) {
//        // STATE: COMPLETED (Gold color)
//        if (point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2)) {
//            draw_set_color(c_yellow); // Hover color
//            if (mouse_check_button_pressed(mb_left)) {
//                global.current_level = i;
//                instance_create_layer(0, 0, "Instances", obj_circuitBuilder);
//                instance_destroy();
//            }
//        } else {
//            draw_set_color(make_color_rgb(255, 215, 0)); // Gold
//        }
//    } else if (_is_unlocked) {
//        // STATE: UNLOCKED BUT NOT BEATEN (White color)
//        if (point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2)) {
//            draw_set_color(c_lime); // Hover color
//            if (mouse_check_button_pressed(mb_left)) {
//                global.current_level = i;
//                instance_create_layer(0, 0, "Instances", obj_circuitBuilder);
//                instance_destroy();
//            }
//        } else {
//            draw_set_color(c_white);
//        }
//    } else {
//        // STATE: LOCKED
//        draw_set_color(c_dkgray); 
//    }
    
//    draw_rectangle(_x1, _y1, _x2, _y2, false);
    
//    // 2. Draw Border & Text
//    draw_set_color(c_black);
//    draw_rectangle(_x1, _y1, _x2, _y2, true);
    
//    if (_is_completed) {
//        draw_text(_x1 + (box_width / 2), _y1 + (box_height / 2) - 10, "Level " + string(_level_num));
//        draw_text(_x1 + (box_width / 2), _y1 + (box_height / 2) + 15, "Completed");
//    } else if (_is_unlocked) {
//        draw_text(_x1 + (box_width / 2), _y1 + (box_height / 2), "Level " + string(_level_num));
//    } else {
//        draw_set_color(c_gray);
//        draw_text(_x1 + (box_width / 2), _y1 + (box_height / 2), "Locked");
//    }
//}

//// Reset alignments
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);

// 1. Calculate Grid dimensions
var _total_columns = 5;
var _total_rows = 2;
var _grid_width = (_total_columns * box_width) + ((_total_columns - 1) * padding);
var _grid_height = (_total_rows * box_height) + ((_total_rows - 1) * padding);

// 2. The True Center of the Window
var _center_x = room_width / 2;
var _center_y = room_height / 2;

// ==========================================
// THE MASTER NUDGE
// Change this number to slide everything up or down!
// Try 30 or 40 to push it down slightly from where it is right now.
var _y_nudge = 35; 
// ==========================================

var _start_x = _center_x - (_grid_width / 2);
var _start_y = _center_y - (_grid_height / 2) + _y_nudge;

// --- DRAW TITLE ---
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the title sitting exactly 60 pixels above the top of the grid
draw_text_transformed(_center_x, _start_y - 60, "SELECT LEVEL", 2, 2, 0);

// --- DRAW GRID ---
var _mx = mouse_x; 
var _my = mouse_y;

for (var i = 0; i < global.total_levels; i++) {
    var _col = i % 5;
    var _row = floor(i / 5);
    
    var _x1 = _start_x + (_col * (box_width + padding));
    var _y1 = _start_y + (_row * (box_height + padding));
    var _x2 = _x1 + box_width;
    var _y2 = _y1 + box_height;
    
    var _level_num = i + 1;
    var _is_completed = (i < global.highest_unlocked);
    var _is_unlocked = (i <= global.highest_unlocked);
    
    // Background & Clicks
    if (_is_completed) {
        if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2)) {
            draw_set_color(c_yellow);
            if (mouse_check_button_pressed(mb_left)) {
                global.current_level = i;
                instance_create_layer(0, 0, "Instances", obj_circuitBuilder);
                instance_destroy();
            }
        } else {
            draw_set_color(make_color_rgb(255, 215, 0)); // Gold
        }
    } else if (_is_unlocked) {
        if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2)) {
            draw_set_color(c_lime);
            if (mouse_check_button_pressed(mb_left)) {
                global.current_level = i;
                instance_create_layer(0, 0, "Instances", obj_circuitBuilder);
                instance_destroy();
            }
        } else {
            draw_set_color(c_white);
        }
    } else {
        draw_set_color(c_dkgray); 
    }
    
    draw_rectangle(_x1, _y1, _x2, _y2, false);
    
    // Border & Text
    draw_set_color(c_black);
    draw_rectangle(_x1, _y1, _x2, _y2, true);
    
    if (_is_completed) {
        draw_set_color(c_black);
        draw_text(_x1 + (box_width / 2), _y1 + (box_height / 2) - 10, "Level " + string(_level_num));
        draw_text(_x1 + (box_width / 2), _y1 + (box_height / 2) + 15, "DONE");
    } else if (_is_unlocked) {
        draw_set_color(c_black);
        draw_text(_x1 + (box_width / 2), _y1 + (box_height / 2), "Level " + string(_level_num));
    } else {
        draw_set_color(c_silver); // Light gray text on the dark gray box
        draw_text(_x1 + (box_width / 2), _y1 + (box_height / 2), "Locked");
    }
}

// Reset alignment and color
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);