var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// The game is drawn full-screen by GameMaker itself.
// Keep these so any touch code that reads them still works.
global.game_draw_x = 0;
global.game_draw_y = 0;
global.game_draw_w = gui_w;
global.game_draw_h = gui_h;

// Button layout (must match the Step event)
var dpad_cx  = gui_w * 0.25;
var dpad_cy  = gui_h * 0.75;
var dpad_r   = 65;

var btn_a_cx = gui_w * 0.80;
var btn_a_cy = gui_h * 0.73;
var btn_a_r  = 35;

var btn_b_cx = gui_w * 0.60;
var btn_b_cy = gui_h * 0.77;
var btn_b_r  = 35;

draw_set_alpha(0.4); // lower alpha so the game stays visible underneath

// D-Pad
draw_set_color(c_white);
draw_circle(dpad_cx, dpad_cy, dpad_r, false);

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
draw_text(20, 20, "L:" + string(global.v_left) + " R:" + string(global.v_right)
    + " U:" + string(global.v_up) + " D:" + string(global.v_down)
    + " room:" + room_get_name(room));