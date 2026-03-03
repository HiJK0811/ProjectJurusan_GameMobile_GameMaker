gateType = logicGateType.BUFFER;		// type of logic gate
inputsFrom = [];						// array of instances it got the inputs from
currentState = logicState.OFF;			// is the logic gate activated or not?
outputsTo = [];							// array of instances it sends the output to

function set_gateType(type){
	gateType = type;
	image_index = gateType;
}

function set_state(newState){
	if(currentState == newState){
		return;
	}
	else{
		currentState = newState;
		
		for(var i = 0; i < array_length(outputsTo); i++){
			outputsTo[i].update_inputs();
		}
	}
}

function update_inputs(){
	var result;
	
	switch(gateType){
		case logicGateType.BUFFER:
			result = inputsFrom[0].currentState;
			break;
		case logicGateType.INVERTER:
			if(inputsFrom[0].currentState == logicState.OFF){
				result = logicState.ON
			}
			else{
				result = logicState.OFF
			}
			break;
		case logicGateType.AND:
			// if at least one input is false, output is false
			result = logicState.ON;
			for(var i=0; i<array_length(inputsFrom); i++){
				if(inputsFrom[i].currentState == logicState.OFF){
					result = logicState.OFF;
					break;
				}
			}
			break;
		case logicGateType.NAND:
			// if at least one input is false, output is true
			result = logicState.OFF;
			for(var i=0; i<array_length(inputsFrom); i++){
				if(inputsFrom[i].currentState == logicState.OFF){
					result = logicState.ON;
					break;
				}
			}
			break;
		case logicGateType.OR:
			// if at least one input is true, output is true
			result = logicState.OFF;
			for(var i=0; i<array_length(inputsFrom); i++){
				if(inputsFrom[i].currentState == logicState.ON){
					result = logicState.ON;
					break;
				}
			}
			break;
		case logicGateType.NOR:
			// if at least one input is true, output is false
			result = logicState.ON;
			for(var i=0; i<array_length(inputsFrom); i++){
				if(inputsFrom[i].currentState == logicState.ON){
					result = logicState.OFF;
					break;
				}
			}
			break;
	}

	set_state(result);
}