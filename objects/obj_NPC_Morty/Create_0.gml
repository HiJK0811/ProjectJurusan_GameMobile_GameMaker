// Inherit the parent event
event_inherited();

states = {
	idle:{
		right: spr_Morty_Idle_Right,
		up: spr_Morty_Idle_Up,
		left: spr_Morty_Idle_Left,
		down: spr_Morty_Idle_Down
	},
	walking:{
		right: spr_Morty_Walk_Right,
		up: spr_Morty_Walk_Up,
		left: spr_Morty_Walk_Left,
		down: spr_Morty_Walk_Down
	}
}

state = states.idle;
