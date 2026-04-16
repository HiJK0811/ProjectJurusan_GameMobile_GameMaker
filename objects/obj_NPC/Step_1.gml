// Inherit the parent event
event_inherited();

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
// If the NPC isn't going anywhere
else{
	if(behavior == "wander"){
		// Wait and select random path
		wander_timer--;
		if(wander_timer <= 0){
			var _targetX = home_x + irandom_range(-wander_range, wander_range);
			var _targetY = home_y + irandom_range(-wander_range, wander_range);
		
			set_path_to(_targetX, _targetY);
		
			wander_timer = irandom_range(wander_min_time, wander_max_time);
		}
	}
	else if(behavior == "chase"){
		set_path_to(obj_Player.x, obj_Player.y)
	}
	else{}
}