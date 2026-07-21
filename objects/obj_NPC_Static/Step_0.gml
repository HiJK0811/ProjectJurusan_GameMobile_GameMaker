// Inherit the parent event
event_inherited();

// 2. ISOLATED SPRITE LOGIC (Only affects obj_NPC_Static)
// If facing DOWN (270 degrees), use the blinking animation
if (moveDirection == 270) {
	
	sprite_index = idle_anim_sprite;
	image_speed = 1; // Play the blinking animation normally
	
} 
// If facing ANY OTHER DIRECTION, use the 4-frame sprite and lock it
else {
	
	sprite_index = base_sprite;
	image_speed = 0; // Stop it from flashing through all directions!
	
	// Lock to the correct frame based on direction
	if (moveDirection == 90) {
		image_index = 1; // Up
	} 
	else if (moveDirection == 180) {
		image_index = 2; // Left
	} 
	else if (moveDirection == 0) {
		image_index = 3; // Right
	}
}

