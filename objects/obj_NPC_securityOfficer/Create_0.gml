// 1. Inherit the static behavior and the magic Step event
event_inherited();

// 2. Define exactly what the Security Officer looks like and says
base_sprite = spr_security_Officer; 
idle_anim_sprite = spr_security_Officer_Idle; 
default_direction = 270;

// Set the dialogue ID
text_id = "Adhoc - intro"; // Identification Cutscene

// 3. Fill the states struct so the collision system doesn't crash
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
