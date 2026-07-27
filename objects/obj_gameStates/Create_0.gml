enum GameState{
	EXPLORE,
	MINIGAME,
	CUTSCENE
}

game_state = GameState.EXPLORE

return_room = noone;
return_x	= 0;
return_y	= 0;

minigame_results = undefined;

// == Mninigame Counter ==
// Initialize Best Moves if they don't exist yet
if (!variable_global_exists("best_moves_hanoi")) {
    // Array: [Easy (3), Medium (4), Hard (5)]. "-1" means no score yet.
    global.best_moves_hanoi = [-1, -1, -1]; 
}

if (!variable_global_exists("best_moves_logic")) {
    // Array: 10 slots for 10 levels. "-1" means no score yet.
    global.best_moves_logic = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]; 
}