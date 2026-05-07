function cutscene_next() {
    scene_index++; 
    timer = 0; // Reset timer for any future 'wait' actions
    
    // If we've reached the end of the scene_info array, destroy the controller
    if (scene_index > array_length(scene_info)-1) {
        instance_destroy(obj_cutscene);
    }
}

function cutscene_move_camera(_obj_or_tx, _ty = undefined){
	if(_ty == undefined){
		if(instance_exists(_obj_or_tx)){
			obj_Camera.follow = _obj_or_tx;
		}
	}
	else{
		obj_Camera.follow = noone;
		obj_Camera.xTo = _obj_or_tx;
		obj_Camera.yTo = _ty;
	}	
	cutscene_next();
}

function cutscene_move_character(_obj_id, _tx, _ty) {
    with(_obj_id) {
        // If the character isn't currently moving...
        if (!path_active) { 
            // Check: Are we already at the target? (within 4 pixels)
            if (point_distance(x, y, _tx, _ty) > 4) {
                set_path_to(_tx, _ty); // Start moving
            } else {
                // We arrived! Move the cutscene to the next action
                with(other){
					cutscene_next();
				}
            }
        } 
        // If path_active IS true, the script does nothing and waits 
        // for the Character's own code to finish the walk.
    }
}

function cutscene_show_dialogue(_text_id) {
    if(!dialogue_started){
		create_textbox(_text_id);
		dialogue_started = true;
	}
	if (!instance_exists(obj_dialogBox)) {
        dialogue_started = false;
		cutscene_next();
	}
}

function cutscene_rotate_character(_obj_id, _direction) {
    with(_obj_id) {
        moveDirection = _direction; 
        sprite_index = get_sprite(moveDirection); 
    }
    cutscene_next();
}

function cutscene_wait(_seconds) {
    timer--; // 'timer' is a variable in your obj_cutscene
    
    if (timer <= 0) {
        cutscene_next();
    }
}

