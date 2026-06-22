// Tutorial by Peyton Burnham
// Branching Dialog System with Effects in GMS 2
// https://www.youtube.com/playlist?list=PL14Yj-e2sgzzWFPozdX-HEjJFqjdIXQfF

display_set_gui_size(640, 360)

// Episode 2
accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)

// Episode 1
dialogBox_x = 0;
dialogBox_y = 270;

// Episode 1
// Setup
if (setup == false){
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// Loop through the pages
	for(var curr_page = 0; curr_page < page_number; curr_page++){
		
		// Find how many characters are on each page and store that number in the "text_length" array
		text_length[curr_page] = string_length(text[curr_page]);
		
		// Episode 4
		// Get x position for dialog box
			// Character on left
			if(speaker_side[curr_page] == 1){
				// Modification: Resize Box
				dialogBox_width[curr_page] = 424;
				line_width[curr_page] = dialogBox_width[curr_page] - border*2;
				
				dialogBox_x_offset[curr_page] = 108;
				portrait_x_offset[curr_page] = 40;
			}
			// Character on right
			else if(speaker_side[curr_page] == -1){
				// Modification: Resize Box
				dialogBox_width[curr_page] = 424;
				line_width[curr_page] = dialogBox_width[curr_page] - border*2;
				
				dialogBox_x_offset[curr_page] = 108;
				portrait_x_offset[curr_page] = 536;
			}
			
			// No Character, Dialog Box Centered
			if(speaker_sprite[curr_page] == noone){
				// Modification: Resize Box
				dialogBox_width[curr_page] = 424;
				line_width[curr_page] = dialogBox_width[curr_page] - border*2;
				
				dialogBox_x_offset[curr_page] = 108;
				
			}
			
		// Episode 3
		// setting individual characters and finding where the line breaks should be
		for(var c = 0; c < text_length[curr_page]; c++){
			var _char_pos = c+1;
		
			// store individual characters in the array
			chara[c, curr_page] = string_char_at(text[curr_page], _char_pos)
			
			// get current width of line
			var _text_up_to_char = string_copy(text[curr_page], 1, _char_pos);
			var _current_text_width = string_width(_text_up_to_char) - string_width(chara[c, curr_page]);
			
			// get the last free space
			if (chara[c, curr_page] == " "){
				last_free_space = _char_pos + 1;
			}
			
			// get the line breaks
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
			
			// get current width of line
			var _text_up_to_char = string_copy(text[curr_page], 1, _char_pos);
			var _current_text_width = string_width(_text_up_to_char) - string_width(chara[c, curr_page]);
			var _text_line = 0;
				
			// compensate for string breaks
			for (var lb = 0; lb < line_break_num[curr_page]; lb++){
				if (_char_pos >= line_break_pos[lb, curr_page]){
					var _str_copy = string_copy(text[curr_page], line_break_pos[lb, curr_page], _char_pos - line_break_pos[lb, curr_page])
					_current_text_width = string_width(_str_copy)
				
					// record the line this character should be on
					_text_line = lb + 1;
				}
			}
				 
			 // add to the x and y coordinates
			 chara_x[c, curr_page] = _text_x + _current_text_width
			 chara_y[c, curr_page] = _text_y + _text_line * line_separation
		}
	}
}

// Typing the text
if (draw_character < text_length[page]) {
	draw_character += text_speed
	draw_character = clamp(draw_character, 0, text_length[page])
}

// Flip through pages
if(accept_key){
	// If done typing
	if(draw_character == text_length[page]){
		// Go to next page
		if (page < page_number-1){
			text_speed = 1;			// Modification: Set speed to 1 for new page
			page++
			draw_character = 0;
		}
		// Destroy 
		else{
			// Episode 2
			// Link text for options
			if(option_number > 0){
				create_textbox(option_link_id[option_pos]);
			}
			instance_destroy()
		}
	}
	// If not done typing
	else{
		// Teleport to end
		// draw_character = text_length[page];
		// Modification: Increase Speed
		text_speed = 10;
	}
}

// Episode 1
// Draw Textbox
var _dialogBox_x = dialogBox_x + dialogBox_x_offset[page];
var _dialogBox_y = dialogBox_y;
dialogBox_image += dialogBox_image_speed;
dialogBox_spr_w = sprite_get_width(dialogBox_sprite[page])
dialogBox_spr_h = sprite_get_height(dialogBox_sprite[page])

// Episode 4
// Draw Character Portrait
if(speaker_sprite[page] != noone){
	sprite_index = speaker_sprite[page]
	if(draw_character == text_length[page]){
		image_index = 0;
	}
		
	var _speaker_x = dialogBox_x + portrait_x_offset[page];
	
	if(speaker_side[page] == -1){
		_speaker_x += sprite_width;
	}
	
	// Draw the speaker
	draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, (dialogBox_x + portrait_x_offset[page]), dialogBox_y, (sprite_width/dialogBox_spr_w), (sprite_height/dialogBox_spr_h), 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x, dialogBox_y, speaker_side[page], 1, 0, c_white, 1)
}

// Episode 1
// Back of the Textbox
draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, _dialogBox_x, _dialogBox_y, dialogBox_width[page]/dialogBox_spr_w, dialogBox_height/dialogBox_spr_h, 0, c_white, 1);

// Episode 2
// Options
if (draw_character == text_length[page] && page == page_number - 1){
	// Select options
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
	option_pos = clamp(option_pos, 0, option_number - 1);
	
	// Draw options
	var _options_border = 4;
	var _options_space = sprite_get_height(spr_font1) + _options_border;
	for(var opt = 0; opt < option_number; opt++){
		// Option boxes
		var _option_width = string_width(option[opt]) + 2*_options_border;
		draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, (_dialogBox_x + 16), (_dialogBox_y - _options_space * option_number + _options_space * opt), (_option_width/dialogBox_spr_w), ((_options_space - 1)/dialogBox_spr_h), 0, c_white, 1);
	
		// Selection Arrow
		if (option_pos == opt){
			draw_sprite(spr_optionsPointer, 0, _dialogBox_x, (_dialogBox_y - _options_space * option_number + _options_space * opt))
		}
	
		// Option text
		draw_text((_dialogBox_x + 16 + _options_border), (_dialogBox_y - _options_space * option_number + _options_space * opt + _options_border/2), option[opt])
	}
}

// Episode 3
// Draw Text
for (var c = 0; c < draw_character; c++){
	draw_text(chara_x[c, page], chara_y[c, page], chara[c, page])
}