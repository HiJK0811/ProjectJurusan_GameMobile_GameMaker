if (o_game.game_state != GameState.EXPLORE) {
	image_index = 1;
	exit;
}

/*
if (keyboard_check_pressed(ord("F"))){
	create_dialogue([
	{
		name: "hello",
		msg: "yay"
	}
	]
	)
} */

// Get Input
right_key	= (keyboard_check(vk_right)	or keyboard_check(ord("D")))
left_key	= (keyboard_check(vk_left)	or keyboard_check(ord("A")))
up_key		= (keyboard_check(vk_up)	or keyboard_check(ord("W")))
down_key	= (keyboard_check(vk_down)	or keyboard_check(ord("S")))

x_speed = (right_key - left_key) * movement_speed;
y_speed = (down_key - up_key) * movement_speed;

// Set Sprite
mask_index = sprite[DOWN]
if (y_speed == 0){
	if (x_speed > 0) {face = RIGHT};
	if (x_speed < 0) {face = LEFT};
}
if (x_speed > 0 and face == LEFT) {face = RIGHT}
if (x_speed < 0 and face == RIGHT) {face = LEFT}

if (x_speed == 0){
	if (y_speed > 0) {face = DOWN};
	if (y_speed < 0) {face = UP};
}
if (y_speed > 0 and face == UP) {face = DOWN}
if (y_speed < 0 and face == DOWN) {face = UP}

sprite_index = sprite[face]

// Stop Animate when Idle
if (x_speed == 0 and y_speed == 0){
	image_index = 1;
}

// Collision
if place_meeting(x + x_speed, y, [o_functional_wall, o_functional_interactibles]) == true{
	x_speed = 0;
	if (y_speed == 0) {
		image_index = 1;
	}
}	
if place_meeting(x, y + y_speed, [o_functional_wall, o_functional_interactibles]) == true{
	y_speed = 0;
	if (x_speed == 0) {
		image_index = 1;
	}
}

// Sprint
if (keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X"))) {
	movement_speed += 1;	
} else if (keyboard_check_released(vk_shift) || keyboard_check_released(ord("X"))) {
	movement_speed -= 1;	
}

// Moving the Player
x += x_speed;
y += y_speed;

// Fix diagonal speed
var len = point_distance(0, 0, x_speed, y_speed);
if (len > movement_speed) {
    x_speed = (x_speed / len) * movement_speed;
    y_speed = (y_speed / len) * movement_speed;
}

// Depth
depth = -bbox_bottom;