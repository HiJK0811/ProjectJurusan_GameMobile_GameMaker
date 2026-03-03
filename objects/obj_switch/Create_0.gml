currentState = logicState.OFF;	// is the switch on/off?
outputsTo = [];					// array of instances it sends the output to

function set_state(newState){
	if(currentState == newState){
		return;
	}
	else{
		currentState = newState;
		image_index = currentState;
		
		for(var i = 0; i < array_length(outputsTo); i++){
			outputsTo[i].update_inputs();
		}
	}
}