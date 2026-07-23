if(currentState == logicState.ON){
	set_state(logicState.OFF)
}
else if(currentState == logicState.OFF){
	set_state(logicState.ON)
}

// Check if the builder exists and the game IS NOT beaten yet
if (instance_exists(obj_circuitBuilder) && !obj_circuitBuilder.level_completed) {
    obj_circuitBuilder.moves_made += 1;
}