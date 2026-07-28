// Global Objects
global.played_cutscenes = {};

// ==  Track Cutscene Completion ==

	// Track if the logic gate minigame is beaten
	if (!variable_global_exists("logic_gate_completed")) {
		global.logic_gate_completed = false;
	}
	
	// Track if the hanoi minigame is beaten (FIXED)
	if (!variable_global_exists("hanoi_completed")) {
		global.hanoi_completed = false;
	}