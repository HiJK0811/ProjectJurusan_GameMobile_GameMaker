// Inherit the parent event
event_inherited();
if(path_active){
	exit;
}

if(instance_exists(obj_cutscene)){
	exit;
}

// If the NPC isn't going anywhere
if(!path_active){
	if(behavior == "wander"){
		// Wait and select random path
		wander_timer--;
		if(wander_timer <= 0){
			var _tries = 20;
			
			var _targetX, _targetY;

			repeat (_tries) {
				_targetX = home_x + irandom_range(-wander_range, wander_range);
				_targetY = home_y + irandom_range(-wander_range, wander_range);

				// Check that the destination isn't occupied
				if (!place_meeting(_targetX, _targetY, obj_Wall) && !place_meeting(_targetX, _targetY, obj_Interactibles)) {
					set_path_to(_targetX, _targetY);
					break;
				}
			}
			
			// var _targetX = home_x + irandom_range(-wander_range, wander_range);
			// var _targetY = home_y + irandom_range(-wander_range, wander_range);
		
			// set_path_to(_targetX, _targetY);
		
			wander_timer = irandom_range(wander_min_time, wander_max_time);
		}
	}
	else if(behavior == "chase"){
		set_path_to(obj_Player.x, obj_Player.y)
	}
	else{}
}