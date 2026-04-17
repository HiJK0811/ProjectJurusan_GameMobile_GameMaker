/*
if(o_game.game_state != GameState.EXPLORE){
	exit;
}
*/

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
	moveDirection = point_direction(0, 0, input_x, input_y);
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

depth = -bbox_bottom;