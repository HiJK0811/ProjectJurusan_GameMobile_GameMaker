if (obj_gameStates.game_state != GameState.EXPLORE) {
	exit;
}

draw_self()

draw_path(path, x, y, true)

for(var i = 0; i < path_get_number(path); i++){
	var _x = path_get_point_x(path, i);
    var _y = path_get_point_y(path, i);
    draw_circle_colour(_x, _y, 3, c_yellow, c_yellow, false); // Draw point
    if(i > 0){ // Draw line to previous point
        var _px = path_get_point_x(path, i-1);
        var _py = path_get_point_y(path, i-1);
        draw_line_colour(_px, _py, _x, _y, c_yellow, 5);
    }
}