// Get GUI Dimensions
var gui_W = display_get_gui_width();
var gui_H = display_get_gui_height();

// Draw Fade
draw_set_alpha(alpha);
draw_set_colour(color);

draw_rectangle(0, 0, gui_W, gui_H, 0);

draw_set_alpha(1);
draw_set_colour(c_white);