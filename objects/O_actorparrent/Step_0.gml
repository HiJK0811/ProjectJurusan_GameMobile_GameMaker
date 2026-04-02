var x_speed=lengthdir_x(spd,dir);
var y_speed=lengthdir_y(spd,dir);

x += x_speed;
y += y_speed;
// Set Sprite
mask_index = sprite[DOWN]
if (spd){
	if (x_speed > 0) {face = RIGHT};
	if (x_speed < 0) {face = LEFT};
}
if (x_speed > 0 and face = LEFT) {face = RIGHT}
if (x_speed < 0 and face = RIGHT) {face = LEFT}

if (spd){
	if (y_speed > 0) {face = DOWN};
	if (y_speed < 0) {face = UP};
}
if (y_speed > 0 and face = UP) {face = DOWN}
if (y_speed < 0 and face = DOWN) {face = UP}

sprite_index = sprite[face]

// Stop Animate when Idle
if (x_speed == 0 and y_speed == 0){
	image_index = 1;
}

// Collision
if place_meeting(x + x_speed, y, [o_functional_wall, o_functional_interactibles]) == true{
	x_speed = 0;
}	
if place_meeting(x, y + y_speed, [o_functional_wall, o_functional_interactibles]) == true{
	y_speed = 0;
}