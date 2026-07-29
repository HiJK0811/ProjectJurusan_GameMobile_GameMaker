// Inherit the setup from obj_NPC_Static
event_inherited();

// Set the two distinct sprites
base_sprite = spr_Yuna; // The 4-frame sprite for interactions
idle_anim_sprite = spr_Yuna_Idle; // The idle sprite for default
default_direction = 270;

// Set the dialogue ID
// text_id = "SecurityOfficer_default";

// Fill the states struct so the collision system doesn't crash
// Prevent collision mask crashes in the grandparent (obj_character)
states = {
	idle: { 
		right: idle_anim_sprite, up: idle_anim_sprite, left: idle_anim_sprite, down: idle_anim_sprite 
	},
	walking: { 
		right: base_sprite, up: base_sprite, left: base_sprite, down: base_sprite 
	}
};

state = states.idle;