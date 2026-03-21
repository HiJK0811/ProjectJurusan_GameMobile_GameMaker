// Tutorial by Peyton Burnham
// How to Make a Menu System (with Submenus) in GameMaker Studio 2!
// https://www.youtube.com/watch?v=xLasKr0ekHY

// Draw Options
draw_set_font(global.font_main)
draw_set_valign(fa_top)
draw_set_halign(fa_left)

// Dynamic Width & Height
var _width = 0;
for(var i = 0; i < options_length; i++){
	var _option_width = string_width(option[menu_level, i])
	_width = max(_option_width, _width)
}
width = _width + options_border*2;
height = options_border*2 + string_height(option[0,0]) + (options_length-1) * options_space;

// Center Textbox
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2

// Draw TextBox
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

// Draw Options
for(var i = 0; i<options_length; i++){
	var _color = c_white;
	if (select_position == i){
		_color = c_yellow;
	}
	draw_text_color(x + options_border, y + options_border + options_space * i, option[menu_level, i], _color, _color, _color, _color, 1)
}