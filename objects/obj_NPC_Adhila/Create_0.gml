// Inherit the parent event
event_inherited();

states = {
	idle:{
		right: spr_Adhila_Idle_Right,
		up: spr_Adhila_Idle_Up,
		left: spr_Adhila_Idle_Left,
		down: spr_Adhila_Idle_Down
	},
	walking:{
		right: spr_Adhila_Walk_Right,
		up: spr_Adhila_Walk_Up,
		left: spr_Adhila_Walk_Left,
		down: spr_Adhila_Walk_Down
	}
}

state = states.idle;
