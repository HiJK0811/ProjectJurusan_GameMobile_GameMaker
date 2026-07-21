// 1. Inherit the static behavior and the magic Step event
event_inherited();

// 2. Define exactly what the Security Officer looks like and says
base_sprite = spr_security_Officer; 
idle_anim_sprite = spr_security_Officer_Idle; 
text_id = "Adhoc - intro"; // Identification Cutscene

// 3. Fill the states struct so the collision system doesn't crash
states = {
	idle: { 
		right: base_sprite, up: base_sprite, left: base_sprite, down: base_sprite 
	},
	walking: { 
		right: base_sprite, up: base_sprite, left: base_sprite, down: base_sprite 
	}
};

state = states.idle;
