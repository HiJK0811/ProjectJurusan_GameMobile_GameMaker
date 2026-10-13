// Inherit the parent event
event_inherited();

states = {
	idle:{
		right: spr_stafCafe_Idle_Right,
		up: spr_stafCafe_Idle_Up,
		left: spr_stafCafe_Idle_Left,
		down: spr_stafCafe_Idle_Down
	},
	walking:{
		right: spr_stafCafe_Walk_Right,
		up: spr_stafCafe_Walk_Up,
		left: spr_stafCafe_Walk_Left,
		down: spr_stafCafe_Walk_Down
	}
}

state = states.idle;
