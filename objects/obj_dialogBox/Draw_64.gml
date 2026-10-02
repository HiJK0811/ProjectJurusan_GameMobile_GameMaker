//// Tutorial by Peyton Burnham
//// Branching Dialog System with Effects in GMS 2
//// https://www.youtube.com/playlist?list=PL14Yj-e2sgzzWFPozdX-HEjJFqjdIXQfF

display_set_gui_size(640, 360)

accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)

dialogBox_x = 0;
dialogBox_y = 250;

// Setup
if (setup == false){
	setup = true;
	
	// --- FIX 1: CLEAR INPUT BLEED-THROUGH ---
	// Clears the keypress used to talk to the NPC so it doesn't skip the first line!
	keyboard_clear(vk_space);
	keyboard_clear(vk_enter);
	accept_key = false; 
	// ----------------------------------------
	
	draw_set_font(font_menu);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// Loop through the pages
	for(var curr_page = 0; curr_page < page_number; curr_page++){
		
		text_length[curr_page] = string_length(text[curr_page]);
		
		var _box_w = 424; 
		var _port_size = dialogBox_height; 
		var _padding = 8; // The gap between the portrait and the text box
		
		if (speaker_sprite[curr_page] != noone) {
			if(speaker_side[curr_page] == 1){ // NPC (Left)
				dialogBox_width[curr_page] = _box_w;
				portrait_x_offset[curr_page] = 52;
				dialogBox_x_offset[curr_page] = portrait_x_offset[curr_page] + _port_size + _padding; 
			}
			else if(speaker_side[curr_page] == -1){ // Player (Right)
				dialogBox_width[curr_page] = _box_w;
				dialogBox_x_offset[curr_page] = 52;
				portrait_x_offset[curr_page] = dialogBox_x_offset[curr_page] + _box_w + _padding;
			}
		} 
		else { 
			dialogBox_width[curr_page] = _box_w;
			dialogBox_x_offset[curr_page] = (640 - _box_w) / 2; 
		}
		
		line_width[curr_page] = dialogBox_width[curr_page] - border*2;
			
		// setting individual characters and finding where the line breaks should be
		for(var c = 0; c < text_length[curr_page]; c++){
			var _char_pos = c+1;
		
			chara[c, curr_page] = string_char_at(text[curr_page], _char_pos)
			
			var _text_up_to_char = string_copy(text[curr_page], 1, _char_pos);
			var _current_text_width = string_width(_text_up_to_char) - string_width(chara[c, curr_page]);
			
			if (chara[c, curr_page] == " "){ last_free_space = _char_pos + 1; }
			
			if (_current_text_width - line_break_offset[curr_page] > line_width[curr_page]){
				line_break_pos[line_break_num[curr_page], curr_page] = last_free_space;
				line_break_num[curr_page]++;
				var _text_up_to_last_space = string_copy(text[curr_page], 1, last_free_space)
				var _last_free_space_string = string_char_at(text[curr_page], last_free_space)
				line_break_offset[curr_page] = string_width(_text_up_to_last_space) - string_width(_last_free_space_string)
			} 
		}
		
		// get each character's coordinates
		for(var c = 0; c < text_length[curr_page]; c++){
			var _char_pos = c+1;
			var _text_x = dialogBox_x + dialogBox_x_offset[curr_page] + border;
			var _text_y = dialogBox_y + border;
			
			var _text_up_to_char = string_copy(text[curr_page], 1, _char_pos);
			var _current_text_width = string_width(_text_up_to_char) - string_width(chara[c, curr_page]);
			var _text_line = 0;
				
			for (var lb = 0; lb < line_break_num[curr_page]; lb++){
				if (_char_pos >= line_break_pos[lb, curr_page]){
					var _str_copy = string_copy(text[curr_page], line_break_pos[lb, curr_page], _char_pos - line_break_pos[lb, curr_page])
					_current_text_width = string_width(_str_copy)
					_text_line = lb + 1;
				}
			}
				 
			 chara_x[c, curr_page] = _text_x + _current_text_width
			 chara_y[c, curr_page] = _text_y + _text_line * line_separation
		}
	}
}

// Typing the text
if (draw_character < text_length[page]) {
	draw_character += text_speed;
	draw_character = clamp(draw_character, 0, text_length[page]);
}

// --- FIX 2: INSTANT CLICK-TO-FINISH LINE & PAGE FLIPPING ---
if (accept_key) {
	// 1. If text is STILL typing, instantly fill the whole line
	if (draw_character < text_length[page]) {
		draw_character = text_length[page];
	}
	// 2. If text is ALREADY finished, advance to the next page or destroy
	else {
		if (page < page_number - 1) {
			page++;
			draw_character = 0;
		}
		else {
			if (option_number > 0) {
				create_textbox(option_link_id[option_pos]);
			}
			instance_destroy();
		}
	}
}
// -----------------------------------------------------------

var _dialogBox_x = dialogBox_x + dialogBox_x_offset[page];
var _dialogBox_y = dialogBox_y;
dialogBox_image += dialogBox_image_speed;
dialogBox_spr_w = sprite_get_width(dialogBox_sprite[page]);
dialogBox_spr_h = sprite_get_height(dialogBox_sprite[page]);

// --- PORTRAIT DRAWING ---
if(speaker_sprite[page] != noone){
	sprite_index = speaker_sprite[page]
	if(draw_character == text_length[page]){ image_index = 0; }
		
	var _speaker_x = dialogBox_x + portrait_x_offset[page];
	var _port_size = dialogBox_height; 
	
	// Draw Portrait Background Box
	draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, _speaker_x, dialogBox_y, _port_size/dialogBox_spr_w, _port_size/dialogBox_spr_h, 0, c_white, 1);
	
	// Draw Portrait Character
	if(speaker_side[page] == -1){ _speaker_x += _port_size; }
	
	var _scale = _port_size / sprite_get_width(sprite_index);
	var _char_h = sprite_get_height(sprite_index) * _scale;
	var _char_y = dialogBox_y + _port_size - _char_h;
	
	draw_sprite_ext(sprite_index, image_index, _speaker_x, _char_y, speaker_side[page] * _scale, _scale, 0, c_white, 1);
}

// Back of the Textbox
draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, _dialogBox_x, _dialogBox_y, dialogBox_width[page]/dialogBox_spr_w, dialogBox_height/dialogBox_spr_h, 0, c_white, 1);

// --- NAME TAGS ---
if (speaker_name[page] != "") {
	
	var _name = speaker_name[page];
	var _name_padding = 8;
	var _name_w = string_width(_name) + (_name_padding * 2);
	var _name_h = string_height(_name) + (_name_padding * 1.5);
	
	var _name_x = _dialogBox_x; 
	var _name_y = _dialogBox_y - _name_h - 4;
	
	if (speaker_side[page] == -1) {
		_name_x = _dialogBox_x + dialogBox_width[page] - _name_w;
	}
	
	draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, _name_x, _name_y, _name_w/dialogBox_spr_w, _name_h/dialogBox_spr_h, 0, c_white, 1);
	draw_text(_name_x + _name_padding, _name_y + (_name_padding/2), _name);
}

// Draw Text
for (var c = 0; c < draw_character; c++){
	draw_text(chara_x[c, page], chara_y[c, page], chara[c, page])
}

// --- INTERNAL OPTIONS ---
if (draw_character == text_length[page] && page == page_number - 1){
	
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number - 1);
	
	var _options_space = 22; 
	var _start_y = _dialogBox_y + border + ((line_break_num[page] + 1) * line_separation) + 6;
	
	for(var opt = 0; opt < option_number; opt++){
		var _opt_y = _start_y + (_options_space * opt);
		var _pointer_w = sprite_get_width(spr_optionsPointer);
		
		if (option_pos == opt){
			draw_sprite(spr_optionsPointer, 0, _dialogBox_x + border, _opt_y + 4);
		}
	
		draw_text(_dialogBox_x + border + _pointer_w + 6, _opt_y, option[opt]);
	}
}

display_set_gui_size(1280, 720);