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
	
	speaker_name[page_number] = "";
	
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
				speaker_name[page_number] = "Player";
				speaker_sprite[page_number] = spr_portrait_player;
				dialogBox_sprite[page_number] = spr_textBox_Purple;
				break;
			
			// NPC
			case "Adhila":
				speaker_name[page_number] = "Adhila";
				speaker_sprite[page_number] = spr_Adhila_Portrait;
				dialogBox_sprite[page_number] = spr_textBox_Purple;
				break;
				
			case "Lylia":
				speaker_name[page_number] = "Lylia"; 
				speaker_sprite[page_number] = spr_Lylia_Portrait;
				dialogBox_sprite[page_number] = spr_textBox_Purple;
				break;
				
			case "Ami":
				speaker_name[page_number] = "Ami"; 
				speaker_sprite[page_number] = spr_Ami_Portrait;
				dialogBox_sprite[page_number] = spr_textBox_Purple;
				break;
				
			//case "Mike":
			//	speaker_name[page_number] = "Mike"; 
			//	speaker_sprite[page_number] = spr_Mike_Portrait;
			//	dialogBox_sprite[page_number] = spr_textBox_Purple;
			//	break;
				
			case "Morty":
				speaker_name[page_number] = "Marty"; 
				// speaker_sprite[page_number] = spr_Mike_Portrait;
				dialogBox_sprite[page_number] = spr_textBox_Purple;
				break;
			
			// Portraitless Characters
			// Security Room
			case "Security Officer":
				speaker_name[page_number] = "Security Officer"; 
				speaker_sprite[page_number] = noone;
				break;
				
			case "Mike":
				speaker_name[page_number] = "Male Security Guard"; 
				speaker_sprite[page_number] = noone;
				break;
				
			case "Sri Kaya":
				speaker_name[page_number] = "Female Security Guard"; 
				speaker_sprite[page_number] = noone;
				break;
			
			// Cafe NPC
			case "Aisyah":
				speaker_name[page_number] = "Aisyah"; 
				speaker_sprite[page_number] = noone;
				break;
				
			case "Ali":
				speaker_name[page_number] = "Ali"; 
				speaker_sprite[page_number] = noone;
				break;
				
			case "Andrun":
				speaker_name[page_number] = "Andrun"; 
				speaker_sprite[page_number] = noone;
				break;
				
			case "Rise":
				speaker_name[page_number] = "Rise"; 
				speaker_sprite[page_number] = noone;
				break;
				
			case "sCafe":
				speaker_name[page_number] = "Staf Cafe"; 
				speaker_sprite[page_number] = noone;
				break;
			
			// Control Room
			case "Gregory":
				speaker_name[page_number] = "Gregory"; 
				speaker_sprite[page_number] = noone;
				break;
				
			case "Roy":
				speaker_name[page_number] = "Gregory"; 
				speaker_sprite[page_number] = noone;
				break;
				
			// Meeting Room
			case "Supervisor":
				speaker_name[page_number] = "Supervisor Gotoh"; 
				speaker_sprite[page_number] = noone;
				break;
				
			case "Reynomn":
				speaker_name[page_number] = "Reynomn"; 
				speaker_sprite[page_number] = noone;
				break;
				
			// Arcade
			case "Yuna":
				speaker_name[page_number] = "Yuna"; 
				speaker_sprite[page_number] = noone;
				break;
				
			case "Yuri":
				speaker_name[page_number] = "Yuri"; 
				speaker_sprite[page_number] = noone;
				break;
				
			case "Bernard":
				speaker_name[page_number] = "Bernard"; 
				speaker_sprite[page_number] = noone;
				break;
			
			
			default:
				speaker_name[page_number] = ""; // NEW: Fallback name
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
