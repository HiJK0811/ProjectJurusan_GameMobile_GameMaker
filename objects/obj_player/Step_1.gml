// Inherit the parent event
event_inherited();

if(!path_active){
	// Get Input
	right_key	= (keyboard_check(vk_right)	or keyboard_check(ord("D")))
	left_key	= (keyboard_check(vk_left)	or keyboard_check(ord("A")))
	up_key		= (keyboard_check(vk_up)	or keyboard_check(ord("W")))
	down_key	= (keyboard_check(vk_down)	or keyboard_check(ord("S")))

	input_x = (right_key - left_key);
	input_y = (down_key - up_key);
}