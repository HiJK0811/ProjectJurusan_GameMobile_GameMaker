// Inherit the parent event
event_inherited();

// If the NPC isn't going anywhere
if(!path_active){
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