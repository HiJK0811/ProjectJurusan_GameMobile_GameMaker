currentState = logicState.OFF;	// is the light bulb on/off
inputsFrom = [];					// instance it got the input from

function update_inputs(){
	currentState = inputsFrom[0].currentState;
	image_index = currentState;
}