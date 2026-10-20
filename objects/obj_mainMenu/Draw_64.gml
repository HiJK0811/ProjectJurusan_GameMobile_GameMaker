var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu);

// --- DRAW TITLE ---
draw_set_color(c_white);
draw_text_transformed(_gui_width / 2, _gui_height / 5, title, 3, 3, 0); 

// --- DRAW BUTTONS ---
for (var i = 0; i < options_max; i++) {
    var _x = _gui_width / 2;
    // 🔥 Posisi awal diturunkan ke _gui_height / 2.8 agar berjarak aman dari judul
    var _y = (_gui_height / 2.8) + (i * (height + margin));
    
    var _color = c_dkgray;
    var _txt_color = c_white;
    var _s = 1;
    
    if (index == i) {
        _color = c_gray;
        _txt_color = c_yellow;
        _s = 1.1; 
    }
    
    // Draw Button Box
    draw_set_color(_color);
    draw_rectangle(_x - (width/2) * _s, _y - (height/2) * _s, _x + (width/2) * _s, _y + (height/2) * _s, false);
    
    // Draw Button Text
    draw_set_color(_txt_color);
    draw_text_transformed(_x, _y, menu[i], _s * 1.5, _s * 1.5, 0);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);