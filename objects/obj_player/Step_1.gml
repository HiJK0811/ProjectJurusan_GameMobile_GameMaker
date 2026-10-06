// Inherit the parent event
event_inherited();

if (obj_gameStates.game_state != GameState.EXPLORE) {
	exit;
}

if(path_active){
	exit;
}

// STOP generating new paths if a cutscene OR a dialogue box exists
if(instance_exists(obj_cutscene) || instance_exists(obj_dialogBox)){
	exit;
}

if(instance_exists(obj_cutscene)){
	exit;
}

if(!path_active){
	// Get Input
	
		// Pastikan variabel global.v_... sudah aman (jika dimainkan di PC murni tanpa objek controller mobile, tambahkan pengecekan aman)
	var v_right = variable_global_exists("v_right") ? global.v_right : false;
	var v_left  = variable_global_exists("v_left")  ? global.v_left  : false;
	var v_up    = variable_global_exists("v_up")    ? global.v_up    : false;
	var v_down  = variable_global_exists("v_down")  ? global.v_down  : false;
	
	right_key	= (keyboard_check(vk_right)	or keyboard_check(ord("D")))
	left_key	= (keyboard_check(vk_left)	or keyboard_check(ord("A")))
	up_key		= (keyboard_check(vk_up)	or keyboard_check(ord("W")))
	down_key	= (keyboard_check(vk_down)	or keyboard_check(ord("S")))

	input_x = (right_key - left_key);
	input_y = (down_key - up_key);
}