if(behavior == "wander"){
		target_x = home_x + irandom_range(-wander_range, wander_range);	
		target_y = home_y + irandom_range(-wander_range, wander_range);
		set_path_to(target_x, target_y);
}