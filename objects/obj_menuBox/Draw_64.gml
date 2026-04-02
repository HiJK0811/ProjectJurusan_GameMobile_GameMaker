draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
if(!menu_active) exit;
// pastikan selalu update
options_length = array_length(option[menu_level]);

// === HITUNG WIDTH ===
var _width = 0;

for(var i = 0; i < options_length; i++){
    var _option_width = string_width(option[menu_level, i]);
    _width = max(_option_width, _width);
}

width = _width + options_border * 2;
height = options_border * 2 + string_height(option[0,0]) + (options_length-1) * options_space;

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

x = gui_w/2 - width/2;
y = gui_h/2 - height/2;

// === BACKGROUND (SAFE VERSION)
draw_set_color(make_color_rgb(20,20,20));
draw_rectangle(x, y, x+width, y+height, false);

// === OPTIONS ===
for(var i = 0; i < options_length; i++){
    
    var _color = (select_position == i) ? c_yellow : c_white;
    
    draw_text_color(
        x + options_border,
        y + options_border + options_space * i,
        option[menu_level, i],
        _color,_color,_color,_color,1
    );
}