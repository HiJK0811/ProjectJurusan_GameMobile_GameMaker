/*
if(o_game.game_state != GameState.EXPLORE){
	exit;
}
*/

// Reset input
input_x = 0;
input_y = 0;

target_x = x;
target_y = y;

// If the NPC is going somewhere
if (path_active) {
	var px = path_get_point_x(path, point_index);
	var py = path_get_point_y(path, point_index);

	if (point_distance(x, y, px, py) < 4) {
		point_index++;

		if (point_index >= path_get_number(path)) {
			path_active = false;
			path_clear_points(path);
			exit;
		}

		px = path_get_point_x(path, point_index);
		py = path_get_point_y(path, point_index);
	}

	var dx = px - x;
	var dy = py - y;

	if (abs(dx) > 2){
		input_x = sign(dx);
	}
	if (abs(dy) > 2){
		input_y = sign(dy);
	}
}