//// 1. Run parent logic (calculates facing the player during dialogue)
//event_inherited();

//// 2. Check if the player is actively talking to THIS NPC
//if (instance_exists(obj_dialogBox) && can_interact) {
	
//	// --- INTERACTING STATE ---
//	sprite_index = base_sprite; // Switch to the 4-frame directional sprite
//	image_speed = 0; // Stop it from animating
	
//	// Lock the frame based on where the player is standing
//	if (moveDirection == 270) {
//		image_index = 0; // Down (Frame 1)
//	} 
//	else if (moveDirection == 90) {
//		image_index = 1; // Up (Frame 2)
//	} 
//	else if (moveDirection == 180) {
//		image_index = 2; // Left (Frame 3)
//	} 
//	else if (moveDirection == 0) {
//		image_index = 3; // Right (Frame 4)
//	}
	
//} 
//else {
	
//	// --- DEFAULT / IDLE STATE ---
//	sprite_index = idle_anim_sprite; // Use idle sprite
	
//	// Play the animation normally (if it has 1 frame, it will just stay on frame 0 safely)
//	image_speed = 1; 
	
//	// Snap back to their default facing direction so they don't get stuck 
//	// facing the player after the dialogue ends!
//	moveDirection = default_direction; 
	
//}

// 1. Run the grandparent's math (faces the player, etc.)
event_inherited();

// 2. Check if a dialogue box is open AND the player is close to THIS specific NPC
var _is_talking = false;
if (instance_exists(obj_dialogBox)) {
	if (distance_to_object(obj_Player) < 4) {
		_is_talking = true;
	}
}

// 3. Apply the correct sprite
if (_is_talking == true) {
	
	// --- INTERACTING STATE ---
	sprite_index = base_sprite; // Use the 4-frame sprite
	image_speed = 0; // Lock the animation
	
	// Lock to the correct frame based on where the player is
	if (moveDirection == 270) {
		image_index = 0; // Down
	} 
	else if (moveDirection == 90) {
		image_index = 1; // Up
	} 
	else if (moveDirection == 180) {
		image_index = 2; // Left
	} 
	else if (moveDirection == 0) {
		image_index = 3; // Right
	}
	
} 
else {
	
	// --- DEFAULT / IDLE STATE ---
	sprite_index = idle_anim_sprite; // Use the blinking animation
	image_speed = 1; // Let it blink at normal speed
	moveDirection = default_direction; // Make sure they face the correct default way
	
}