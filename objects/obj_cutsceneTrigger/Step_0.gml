//if(!instance_exists(obj_cutscene)){
//	if(place_meeting(x, y, obj_Player)){
//		var _inst = instance_create_layer(0, 0, "Instances_Functional", obj_cutscene);
//		instance_deactivate_object(obj_pause)
//		_inst.scene_info = trigger_scene_info;
		
//		if(!permanent){
//			instance_destroy(obj_cutsceneTrigger);
//		}
//	}
//}

if (!instance_exists(obj_cutscene)) {
	if (place_meeting(x, y, obj_Player)) {
		var _inst = instance_create_layer(0, 0, "Instances_Functional", obj_cutscene);
		instance_deactivate_object(obj_pause);
		_inst.scene_info = trigger_scene_info;
		
		if (!permanent) {
			// Save to our global memory that THIS specific cutscene is done
			global.played_cutscenes[$ cutscene_id] = true;
			
			// Destroy ONLY this specific instance
			instance_destroy(); 
		}
	}
}