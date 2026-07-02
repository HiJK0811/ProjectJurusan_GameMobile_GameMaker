// Global Objects
global.played_cutscenes = {};

// Track Cutscene Completion

// Track if the logic gate minigame is beaten
if (!variable_global_exists("logic_gate_completed")) {
	global.logic_gate_completed = false;
}