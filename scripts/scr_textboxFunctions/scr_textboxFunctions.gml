// Tutorial by Peyton Burnham
// Branching Dialog System with Effects in GMS 2! (Part 2: Branching Dialog)
// https://www.youtube.com/watch?v=6Bzj7GdSkJI

function scr_set_defaults_for_text(){
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	dialogBox_sprite[page_number] = spr_textBox_Purple;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	
}

/// @param text
/// @param [character]
/// @param [speaker_side]
function scr_text(_text){
	scr_set_defaults_for_text();
	text[page_number] = _text;
	
	// get character info
	if(argument_count > 1){
		switch(argument[1]){
			case "Player":
				speaker_sprite[page_number] = spr_portrait_player;
				dialogBox_sprite[page_number] = spr_textBox_Purple;
				break;
			case "Happy Derp":
				speaker_sprite[page_number] = spr_portrait_happyDerp;
				dialogBox_sprite[page_number] = spr_textBox_Blue;
				break;
			case "Sad Derp":
				speaker_sprite[page_number] = spr_portrait_sadDerp;
				dialogBox_sprite[page_number] = spr_textBox_Blue;
				break;
			case "Derpy Derp":
				speaker_sprite[page_number] = spr_portrait_derpyDerp;
				dialogBox_sprite[page_number] = spr_textBox_Purple;
				break;
			default:
				speaker_sprite[page_number] = noone;
				break;
		}
	}
	
	// speaker direction
	if(argument_count > 2){
		speaker_side[page_number] = argument[2];
	}
	
	page_number++;
}

/// @param option
/// @param link_id
function scr_option(_option, _link_id){
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}


// @param text_id
function create_textbox(_text_id){
	with (instance_create_depth(0,0, -9999, obj_dialogBox)){
		scr_gameText(_text_id)
	}
}
