/*
if(o_game.game_state != GameState.EXPLORE){
	exit;
}
*/

// Stop movement 
// 1. Check Game State
if (obj_gameStates.game_state != GameState.EXPLORE) {
	input_x = 0;
	input_y = 0;
	exit;
}

// 2. Cutscene / Dialogue Override
if (instance_exists(obj_cutscene) || instance_exists(obj_dialogBox)) {
	
	// Force the player to stop holding keyboard keys
	// (We check !path_active so the cutscene scripts can still move the player!)
	if (!path_active) {
		input_x = 0;
		input_y = 0;
	}
	
} 
// 3. Normal Player Control
else {
	
	// Only read keyboard if we aren't being moved by a path
	if (!path_active) {
		right_key	= (keyboard_check(vk_right)	or keyboard_check(ord("D")));
		left_key	= (keyboard_check(vk_left)	or keyboard_check(ord("A")));
		up_key		= (keyboard_check(vk_up)	or keyboard_check(ord("W")));
		down_key	= (keyboard_check(vk_down)	or keyboard_check(ord("S")));

		input_x = (right_key - left_key);
		input_y = (down_key - up_key);
	}
}

// Normalize input
var len = point_distance(0, 0, input_x, input_y);
if (len > 0) {
	input_x /= len;
	input_y /= len;
}

var x_spd = input_x * moveSpeed;
var y_spd = input_y * moveSpeed;

// Collision 1
mask_index = states.idle.down;

// Direction
if (input_x != 0 || input_y != 0) {
	// Round the direction to eliminate macOS floating-point drift
	moveDirection = round(point_direction(0, 0, input_x, input_y));
}

// Set Sprite
if (x_spd == 0 && y_spd == 0) {
	set_state(states.idle);
	moving = false;
} else {
	set_state(states.walking);
	moving = true;
}

sprite_index = get_sprite(moveDirection);

// Collision 2
if place_meeting(x + x_spd, y, [obj_Wall, obj_Character, obj_Interactibles]) == true{
	x_spd = 0;
}	
if place_meeting(x, y + y_spd, [obj_Wall, obj_Character, obj_Interactibles]) == true{
	y_spd = 0;
}

// Move Character
x += x_spd;
y += y_spd;

// Sprint 
if (keyboard_check_pressed(vk_shift)) {
	moveSpeed += 1;
} else if (keyboard_check_released(vk_shift)) {
	moveSpeed -= 1;	
}

if (global.transitioning) {
    exit; // completely skip movement/input
}

depth = -bbox_bottom;