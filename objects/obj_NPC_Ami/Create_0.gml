// Inherit the parent event
event_inherited();

states = {
	idle:{
		right: spr_Ami_Idle_Right,
		up: spr_Ami_Idle_Up,
		left: spr_Ami_Idle_Left,
		down: spr_Ami_Idle_Down
	},
	walking:{
		right: spr_Ami_Walk_Right,
		up: spr_Ami_Walk_Up,
		left: spr_Ami_Walk_Left,
		down: spr_Ami_Walk_Down
	}
}

state = states.idle;
