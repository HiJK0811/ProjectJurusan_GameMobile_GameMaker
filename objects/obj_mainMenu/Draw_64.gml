var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// display_set_gui_size(320, 180)

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_menu);

// --- DRAW TITLE ---
draw_set_color(c_white);
draw_text_transformed(_gui_width / 2, _gui_height / 4, title, 4, 4, 0);

// --- DRAW BUTTONS ---
for (var i = 0; i < options_max; i++) {
    var _x = _gui_width / 2;
    var _y = (_gui_height / 2) + (i * (height + margin));
    
    // Visual feedback: Change color and scale slightly if hovered
    var _color = c_dkgray;
    var _txt_color = c_white;
    var _s = 1;
    
    if (index == i) {
        _color = c_gray;
        _txt_color = c_yellow;
        _s = 1.1; // Make the button 10% bigger when hovering
    }
    
    // Draw Button Box
    draw_set_color(_color);
    draw_rectangle(_x - (width/2) * _s, _y - (height/2) * _s, _x + (width/2) * _s, _y + (height/2) * _s, false);
    
    // Draw Button Text
	draw_set_color(_txt_color);
	draw_text_transformed(_x, _y, menu[i], _s*2, _s*2, 0);
}