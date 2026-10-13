// Input
input_x = 0;
input_y = 0;

// Movement
moveSpeed = 1.5;

moving = false;
moveDirection = 270;

target_x = x;
target_y = y;

// Functions
get_sprite = function(dir){
	if		(dir == 0){return state.right;}
	else if	(dir == 90){return state.up;}
	else if	(dir == 180){return state.left;}
	else if	(dir == 270){return state.down;}
	else	{return sprite_index;}
}

set_state = function(newState){
	if(state == newState){
		return;
	}
	else{
		state = newState;
		image_index = 0;
	}
}

// Pathfinding
path = path_add();
point_index = 0;
path_active = false;

function set_path_to(_tx, _ty) {
	if (mp_grid_path(obj_Gridmaker.room_grid, path, x, y, _tx, _ty, true)) {
		point_index = 0;
		path_active = true;
	} else {
		path_active = false;
	}
}