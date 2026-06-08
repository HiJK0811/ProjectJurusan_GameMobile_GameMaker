function roomGoToFade(_target_room){
	
	if (!instance_exists(obj_fade)) {
		var _inst = instance_create_depth(0, 0, 0, obj_fade);
		_inst.target_room = _target_room;
	}
}