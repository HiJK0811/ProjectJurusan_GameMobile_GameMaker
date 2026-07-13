// Inherit the parent event
event_inherited();

global.transitioning = false;

states = {
	idle:{
		right: spr_Player_Alt_Idle_Right,
		up: spr_Player_Alt_Idle_Up,
		left: spr_Player_Alt_Idle_Left,
		down: spr_Player_Alt_Idle_Down
	},
	walking:{
		right: spr_Player_Alt_Walk_Right,
		up: spr_Player_Alt_Walk_Up,
		left: spr_Player_Alt_Walk_Left,
		down: spr_Player_Alt_Walk_Down
	}
}

state = states.idle;