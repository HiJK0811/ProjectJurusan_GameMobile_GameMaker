//// Tutorial by Peyton Burnham
//// Branching Dialog System with Effects in GMS 2
//// https://www.youtube.com/playlist?list=PL14Yj-e2sgzzWFPozdX-HEjJFqjdIXQfF

//display_set_gui_size(640, 360)

//// Episode 2
//accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)

//// Episode 1
//dialogBox_x = 0;
//dialogBox_y = 270;

//// Episode 1
//// Setup
//if (setup == false){
//	setup = true;
//	draw_set_font(font_menu);
//	draw_set_valign(fa_top);
//	draw_set_halign(fa_left);
	
//	// Loop through the pages
//	for(var curr_page = 0; curr_page < page_number; curr_page++){
		
//		// Find how many characters are on each page and store that number in the "text_length" array
//		text_length[curr_page] = string_length(text[curr_page]);
		
//		// Episode 4
//		// Get x position for dialog box
//			// Character on left
//			if(speaker_side[curr_page] == 1){
//				// Modification: Resize Box
//				dialogBox_width[curr_page] = 424;
//				line_width[curr_page] = dialogBox_width[curr_page] - border*2;
				
//				dialogBox_x_offset[curr_page] = 108;
//				portrait_x_offset[curr_page] = 40;
//			}
//			// Character on right
//			else if(speaker_side[curr_page] == -1){
//				// Modification: Resize Box
//				dialogBox_width[curr_page] = 424;
//				line_width[curr_page] = dialogBox_width[curr_page] - border*2;
				
//				dialogBox_x_offset[curr_page] = 108;
//				portrait_x_offset[curr_page] = 536;
//			}
			
//			// No Character, Dialog Box Centered
//			if(speaker_sprite[curr_page] == noone){
//				// Modification: Resize Box
//				dialogBox_width[curr_page] = 424;
//				line_width[curr_page] = dialogBox_width[curr_page] - border*2;
				
//				dialogBox_x_offset[curr_page] = 108;
				
//			}
			
//		// Episode 3
//		// setting individual characters and finding where the line breaks should be
//		for(var c = 0; c < text_length[curr_page]; c++){
//			var _char_pos = c+1;
		
//			// store individual characters in the array
//			chara[c, curr_page] = string_char_at(text[curr_page], _char_pos)
			
//			// get current width of line
//			var _text_up_to_char = string_copy(text[curr_page], 1, _char_pos);
//			var _current_text_width = string_width(_text_up_to_char) - string_width(chara[c, curr_page]);
			
//			// get the last free space
//			if (chara[c, curr_page] == " "){
//				last_free_space = _char_pos + 1;
//			}
			
//			// get the line breaks
//			if (_current_text_width - line_break_offset[curr_page] > line_width[curr_page]){
//				line_break_pos[line_break_num[curr_page], curr_page] = last_free_space;
//				line_break_num[curr_page]++;
//				var _text_up_to_last_space = string_copy(text[curr_page], 1, last_free_space)
//				var _last_free_space_string = string_char_at(text[curr_page], last_free_space)
//				line_break_offset[curr_page] = string_width(_text_up_to_last_space) - string_width(_last_free_space_string)
//			} 
//		}
//			// get each character's coordinates
//		for(var c = 0; c < text_length[curr_page]; c++){
//			var _char_pos = c+1;
//			var _text_x = dialogBox_x + dialogBox_x_offset[curr_page] + border;
//			var _text_y = dialogBox_y + border;
			
//			// get current width of line
//			var _text_up_to_char = string_copy(text[curr_page], 1, _char_pos);
//			var _current_text_width = string_width(_text_up_to_char) - string_width(chara[c, curr_page]);
//			var _text_line = 0;
				
//			// compensate for string breaks
//			for (var lb = 0; lb < line_break_num[curr_page]; lb++){
//				if (_char_pos >= line_break_pos[lb, curr_page]){
//					var _str_copy = string_copy(text[curr_page], line_break_pos[lb, curr_page], _char_pos - line_break_pos[lb, curr_page])
//					_current_text_width = string_width(_str_copy)
				
//					// record the line this character should be on
//					_text_line = lb + 1;
//				}
//			}
				 
//			 // add to the x and y coordinates
//			 chara_x[c, curr_page] = _text_x + _current_text_width
//			 chara_y[c, curr_page] = _text_y + _text_line * line_separation
//		}
//	}
//}

//// Typing the text
//if (draw_character < text_length[page]) {
//	draw_character += text_speed
//	draw_character = clamp(draw_character, 0, text_length[page])
//}

//// Flip through pages
//if(accept_key){
//	// If done typing
//	if(draw_character == text_length[page]){
//		// Go to next page
//		if (page < page_number-1){
//			text_speed = 1;			// Modification: Set speed to 1 for new page
//			page++
//			draw_character = 0;
//		}
//		// Destroy 
//		else{
//			// Episode 2
//			// Link text for options
//			if(option_number > 0){
//				create_textbox(option_link_id[option_pos]);
//			}
//			instance_destroy()
//		}
//	}
//	// If not done typing
//	else{
//		// Teleport to end
//		// draw_character = text_length[page];
//		// Modification: Increase Speed
//		text_speed = 10;
//	}
//}

//// Episode 1
//// Draw Textbox
//var _dialogBox_x = dialogBox_x + dialogBox_x_offset[page];
//var _dialogBox_y = dialogBox_y;
//dialogBox_image += dialogBox_image_speed;
//dialogBox_spr_w = sprite_get_width(dialogBox_sprite[page])
//dialogBox_spr_h = sprite_get_height(dialogBox_sprite[page])

//// Episode 4
//// Draw Character Portrait
//if(speaker_sprite[page] != noone){
//	sprite_index = speaker_sprite[page]
//	if(draw_character == text_length[page]){
//		image_index = 0;
//	}
		
//	var _speaker_x = dialogBox_x + portrait_x_offset[page];
	
//	if(speaker_side[page] == -1){
//		_speaker_x += sprite_width;
//	}
	
//	// Draw the speaker
//	draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, (dialogBox_x + portrait_x_offset[page]), dialogBox_y, (sprite_width/dialogBox_spr_w), (sprite_height/dialogBox_spr_h), 0, c_white, 1);
//	draw_sprite_ext(sprite_index, image_index, _speaker_x, dialogBox_y, speaker_side[page], 1, 0, c_white, 1)
//}

//// Episode 1
//// Back of the Textbox
//draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, _dialogBox_x, _dialogBox_y, dialogBox_width[page]/dialogBox_spr_w, dialogBox_height/dialogBox_spr_h, 0, c_white, 1);

//// Episode 2
//// Options
//if (draw_character == text_length[page] && page == page_number - 1){
//	// Select options
//	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
//	option_pos = clamp(option_pos, 0, option_number - 1);
	
//	// Draw options
//	var _options_border = 4;
//	var _options_space = sprite_get_height(spr_font1) + _options_border;
//	for(var opt = 0; opt < option_number; opt++){
//		// Option boxes
//		var _option_width = string_width(option[opt]) + 2*_options_border;
//		draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, (_dialogBox_x + 16), (_dialogBox_y - _options_space * option_number + _options_space * opt), (_option_width/dialogBox_spr_w), ((_options_space - 1)/dialogBox_spr_h), 0, c_white, 1);
	
//		// Selection Arrow
//		if (option_pos == opt){
//			draw_sprite(spr_optionsPointer, 0, _dialogBox_x, (_dialogBox_y - _options_space * option_number + _options_space * opt))
//		}
	
//		// Option text
//		draw_text((_dialogBox_x + 16 + _options_border), (_dialogBox_y - _options_space * option_number + _options_space * opt + _options_border/2), option[opt])
//	}
//}

//// Episode 3
//// Draw Text
//for (var c = 0; c < draw_character; c++){
//	draw_text(chara_x[c, page], chara_y[c, page], chara[c, page])
//}


//// Reset the GUI back to the menu's standard resolution
//display_set_gui_size(1280, 720);

display_set_gui_size(640, 360)

accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)

dialogBox_x = 0;
dialogBox_y = 250;

// Setup
if (setup == false){
	setup = true;
	draw_set_font(font_menu);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// Loop through the pages
	for(var curr_page = 0; curr_page < page_number; curr_page++){
		
		text_length[curr_page] = string_length(text[curr_page]);
		
		var _box_w = 424; 
		
		// --- THE FIX: Use the actual drawn height, not the raw sprite height! ---
		var _port_size = dialogBox_height; 
		var _padding = 8; // The gap between the portrait and the text box
		// ------------------------------------------------------------------------
		
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
	draw_character += text_speed
	draw_character = clamp(draw_character, 0, text_length[page])
}

// Flip through pages
if(accept_key){
	if(draw_character == text_length[page]){
		if (page < page_number-1){
			text_speed = 1;
			page++
			draw_character = 0;
		}
		else{
			if(option_number > 0){
				create_textbox(option_link_id[option_pos]);
			}
			instance_destroy()
		}
	}
	else{
		text_speed = 10;
	}
}

var _dialogBox_x = dialogBox_x + dialogBox_x_offset[page];
var _dialogBox_y = dialogBox_y;
dialogBox_image += dialogBox_image_speed;
dialogBox_spr_w = sprite_get_width(dialogBox_sprite[page])
dialogBox_spr_h = sprite_get_height(dialogBox_sprite[page])


// --- PORTRAIT DRAWING ---
if(speaker_sprite[page] != noone){
	sprite_index = speaker_sprite[page]
	if(draw_character == text_length[page]){ image_index = 0; }
		
	var _speaker_x = dialogBox_x + portrait_x_offset[page];
	var _port_size = dialogBox_height; // Back to 90px so it perfectly matches the text box height
	
	// Draw Portrait Background Box
	draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, _speaker_x, dialogBox_y, _port_size/dialogBox_spr_w, _port_size/dialogBox_spr_h, 0, c_white, 1);
	
	// Draw Portrait Character
	if(speaker_side[page] == -1){ _speaker_x += _port_size; }
	
	// 1. Get the scale needed to make the character's width match the portrait box width
	var _scale = _port_size / sprite_get_width(sprite_index);
	
	// 2. Calculate the character's scaled height
	var _char_h = sprite_get_height(sprite_index) * _scale;
	
	// 3. Anchor it to the bottom of the portrait box
	// (Note: This math assumes your portrait sprite's origin is Top-Left. 
	// If your sprite origin is Bottom-Center, change this to: var _char_y = dialogBox_y + _port_size;)
	var _char_y = dialogBox_y + _port_size - _char_h;
	
	// Draw the character keeping aspect ratio and anchored to bottom
	draw_sprite_ext(sprite_index, image_index, _speaker_x, _char_y, speaker_side[page] * _scale, _scale, 0, c_white, 1);
}

// Back of the Textbox
draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, _dialogBox_x, _dialogBox_y, dialogBox_width[page]/dialogBox_spr_w, dialogBox_height/dialogBox_spr_h, 0, c_white, 1);

// --- NAME TAGS ---
// Only draw the name tag if the name isn't completely blank!
if (speaker_name[page] != "") {
	
	var _name = speaker_name[page];
	var _name_padding = 8;
	var _name_w = string_width(_name) + (_name_padding * 2);
	var _name_h = string_height(_name) + (_name_padding * 1.5);
	
	// Default Left Alignment (For centered boxes and NPC left boxes)
	var _name_x = _dialogBox_x; 
	var _name_y = _dialogBox_y - _name_h - 4;
	
	// Right Alignment for Player
	if (speaker_side[page] == -1) {
		_name_x = _dialogBox_x + dialogBox_width[page] - _name_w;
	}
	
	// Draw Tag Box
	draw_sprite_ext(dialogBox_sprite[page], dialogBox_image, _name_x, _name_y, _name_w/dialogBox_spr_w, _name_h/dialogBox_spr_h, 0, c_white, 1);
	// Draw Name
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
	
	// 1. Increased spacing for cleaner separation between choices
	var _options_space = 22; 
	
	// 2. Tucked the start position slightly higher up (changed +12 to +6) to prevent bottom overflow
	var _start_y = _dialogBox_y + border + ((line_break_num[page] + 1) * line_separation) + 6;
	
	for(var opt = 0; opt < option_number; opt++){
		var _opt_y = _start_y + (_options_space * opt);
		var _pointer_w = sprite_get_width(spr_optionsPointer);
		
		// Draw pointer
		if (option_pos == opt){
			draw_sprite(spr_optionsPointer, 0, _dialogBox_x + border, _opt_y + 4);
		}
	
		// Draw option text
		draw_text(_dialogBox_x + border + _pointer_w + 6, _opt_y, option[opt]);
	}
}

display_set_gui_size(1280, 720);