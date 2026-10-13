// Inherit the parent event
event_inherited();

states = {
	idle:{
		right: spr_Lylia_Idle_Right,
		up: spr_Lylia_Idle_Up,
		left: spr_Lylia_Idle_Left,
		down: spr_Lylia_Idle_Down
	},
	walking:{
		right: spr_Lylia_Walk_Right,
		up: spr_Lylia_Walk_Up,
		left: spr_Lylia_Walk_Left,
		down: spr_Lylia_Walk_Down
	}
}

state = states.idle;
