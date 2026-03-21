// Tutorial by Peyton Burnham
// How to Make a Menu System (with Submenus) in GameMaker Studio 2!
// https://www.youtube.com/watch?v=xLasKr0ekHY

// Get input for selecting options
up_key = keyboard_check_pressed(vk_up)
down_key = keyboard_check_pressed(vk_down)
select_key = keyboard_check_pressed(vk_space)

// Number of options in current menu
options_length = array_length(option[menu_level]);

// Selecting option
select_position += down_key - up_key;

if (select_position >= options_length){
	select_position = 0;
}
else if (select_position < 0){
	select_position = options_length - 1
}

// Selection Logic
if(select_key){
	var _currentMenuLevel = menu_level;
	
	switch(menu_level){
		// Main Menu
		case 0:
			switch(select_position){
				// Start Game
				case 0:
					room_goto(Room2);
					break;
				// Settings
				case 1:
					menu_level = 1;
					break;
				// Quit Game
				case 2:
					game_end();
					break;
			}
		// Main Menu -> Settings
		case 1:
			switch(select_position){
				// Window Size
				case 0:
					menu_level = 2;
					break;
				// Brightness
				case 1:
					break;
				// Controls
				case 2:
					menu_level = 3;
					break;
				// <- Back
				case 3:
					menu_level = 0;
					break;
			}
		// Main Menu -> Settings -> Window Size
		case 2:
			switch(select_position){
				// 4096 x 2160
				case 0:
					break;
				// 1920 x 1080
				case 1:
					break;
				// 1440 x 810
				case 2:
					break;
				// 1280 x 720
				case 3:
					break;
				// <- Back
				case 4:
					menu_level = 1;
					break;
			}
		// Main Menu -> Settings -> Controls
		case 3:
			switch(select_position){
				// WASD
				case 0:
					break;
				// D-Pad
				case 1:
					break;
				// Circle-Pad
				case 2:
					break;
				// Touch
				case 3:
					break;
				// <- Back
				case 4:
					menu_level = 1;
					break;
			}
			
			
	}
	if(_currentMenuLevel != menu_level){
		select_position = 0;
		options_length = array_length(option[menu_level]);
	}
}