var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// The game is drawn full-screen by GameMaker itself.
// Keep these so any touch code that reads them still works.
global.game_draw_x = 0;
global.game_draw_y = 0;
global.game_draw_w = gui_w;
global.game_draw_h = gui_h;

// Button layout (must match the Step event)
var joy_base_r = 80;
var joy_stick_r = 40;
var joy_deadzone = 15;

var btn_a_cx = gui_w * 0.85;
var btn_a_cy = gui_h * 0.80;
var btn_a_r  = 45;

var btn_b_cx = gui_w * 0.70;
var btn_b_cy = gui_h * 0.75;
var btn_b_r  = 40;

draw_set_alpha(0.4); // lower alpha so the game stays visible underneath

// Draw Joystick (if active)
if (global.joy_active) {
    var bx = global.joy_base_x;
    var by = global.joy_base_y;
    var sx = bx + global.joy_x;
    var sy = by + global.joy_y;
    
    // Base circle
    draw_set_color(c_white);
    draw_circle(bx, by, joy_base_r, false);
    
    // Inner deadzone indicator
    draw_set_color(c_white);
    draw_set_alpha(0.2);
    draw_circle(bx, by, joy_deadzone, false);
    draw_set_alpha(0.4);
    
    // Stick
    draw_set_color(c_white);
    draw_circle(sx, sy, joy_stick_r, true);
    
    // Stick center dot
    draw_set_color(c_black);
    draw_circle(sx, sy, 8, true);
}

// Button A
draw_set_color(c_red);
draw_circle(btn_a_cx, btn_a_cy, btn_a_r, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(btn_a_cx, btn_a_cy, "A");

// Button B
draw_set_color(c_blue);
draw_circle(btn_b_cx, btn_b_cy, btn_b_r, false);
draw_set_color(c_white);
draw_text(btn_b_cx, btn_b_cy, "B");

// Reset draw state so other objects aren't affected
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_set_color(c_yellow);
draw_text(20, 50, "A:" + string(global.v_a) + " pressed:" + string(global.v_a_pressed));
draw_text(20, 70, "Joy: " + string(global.joy_x) + ", " + string(global.joy_y));