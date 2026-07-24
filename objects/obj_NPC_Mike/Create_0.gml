// Inherit the parent event
event_inherited();

states = {
	idle:{
		right: spr_Mike_Idle_Right,
		up: spr_Mike_Idle_Up,
		left: spr_Mike_Idle_Left,
		down: spr_Mike_Idle_Down
	},
	walking:{
		right: spr_Mike_Walk_Right,
		up: spr_Mike_Walk_Up,
		left: spr_Mike_Walk_Left,
		down: spr_Mike_Walk_Down
	}
}

state = states.idle;
