//level_completed = false;
//minigame_beaten = false;


////function build_level(level){
////	switch(level){
////		case 1:
////			var lightSwitch_1 = instance_create_layer(100, 100, "Instances", obj_switch);
////			var lightBulb_1 = instance_create_layer(200, 100, "Instances", obj_lightBulb);

////			var lightSwitch_2 = instance_create_layer(100, 200, "Instances", obj_switch);
////			var lightBulb_2 = instance_create_layer(200, 200, "Instances", obj_lightBulb);

////			array_push(lightSwitch_1.outputsTo, lightBulb_1);
////			array_push(lightSwitch_2.outputsTo, lightBulb_2);

////			array_push(lightBulb_1.inputsFrom, lightSwitch_1);
////			array_push(lightBulb_2.inputsFrom, lightSwitch_2);

////			var lightSwitch_3	= instance_create_layer(300, 100, "Instances", obj_switch);
////			var lightSwitch_4	= instance_create_layer(300, 200, "Instances", obj_switch);
////			var logicGate_1		= instance_create_layer(400, 150, "Instances", obj_logicGate);
////			var lightBulb_3		= instance_create_layer(500, 150, "Instances", obj_lightBulb);

////			logicGate_1.set_gateType(logicGateType.AND);

////			array_push(lightSwitch_3.outputsTo, logicGate_1);
////			array_push(lightSwitch_4.outputsTo, logicGate_1);

////			array_push(logicGate_1.inputsFrom, lightSwitch_3);
////			array_push(logicGate_1.inputsFrom, lightSwitch_4);

////			array_push(logicGate_1.outputsTo, lightBulb_3);

////			array_push(lightBulb_3.inputsFrom, logicGate_1);
////		break;
	
////		case 2:
////			var lightSwitch_1 = instance_create_layer(96, 64, "Instances", obj_switch);
////			var lightSwitch_2 = instance_create_layer(384, 64, "Instances", obj_switch);
////			var lightSwitch_3 = instance_create_layer(96, 128, "Instances", obj_switch);
////			var lightSwitch_4 = instance_create_layer(96, 192, "Instances", obj_switch);
////			var lightSwitch_5 = instance_create_layer(384, 128, "Instances", obj_switch);
////			var lightSwitch_6 = instance_create_layer(384, 192, "Instances", obj_switch);
////			var lightSwitch_7 = instance_create_layer(96, 256, "Instances", obj_switch);
////			var lightSwitch_8 = instance_create_layer(96, 320, "Instances", obj_switch);
////			var lightSwitch_9 = instance_create_layer(384, 256, "Instances", obj_switch);
////			var lightSwitch_10 = instance_create_layer(384, 320, "Instances", obj_switch);
			
////			var logicGate_1 = instance_create_layer(160, 64, "Instances", obj_logicGate);
////			var logicGate_2 = instance_create_layer(448, 64, "Instances", obj_logicGate);
////			var logicGate_3 = instance_create_layer(160, 160, "Instances", obj_logicGate);
////			var logicGate_4 = instance_create_layer(448, 160, "Instances", obj_logicGate);
////			var logicGate_5 = instance_create_layer(160, 288, "Instances", obj_logicGate);
////			var logicGate_6 = instance_create_layer(448, 288, "Instances", obj_logicGate);

////			logicGate_1.set_gateType(logicGateType.BUFFER);
////			logicGate_2.set_gateType(logicGateType.INVERTER);
////			logicGate_3.set_gateType(logicGateType.AND);
////			logicGate_4.set_gateType(logicGateType.NAND);
////			logicGate_5.set_gateType(logicGateType.OR);
////			logicGate_6.set_gateType(logicGateType.NOR);
			
////			var lightBulb_1 = instance_create_layer(224, 64, "Instances", obj_lightBulb);
////			var lightBulb_2 = instance_create_layer(512, 64, "Instances", obj_lightBulb);
////			var lightBulb_3 = instance_create_layer(224, 160, "Instances", obj_lightBulb);
////			var lightBulb_4 = instance_create_layer(512, 160, "Instances", obj_lightBulb);
////			var lightBulb_5 = instance_create_layer(224, 288, "Instances", obj_lightBulb);
////			var lightBulb_6 = instance_create_layer(512, 288, "Instances", obj_lightBulb);
		
////			array_push(lightSwitch_1.outputsTo, logicGate_1);
////			array_push(logicGate_1.inputsFrom, lightSwitch_1);
////			array_push(logicGate_1.outputsTo, lightBulb_1);
////			array_push(lightBulb_1.inputsFrom, logicGate_1);
			
////			array_push(lightSwitch_2.outputsTo, logicGate_2);
////			array_push(logicGate_2.inputsFrom, lightSwitch_2);
////			array_push(logicGate_2.outputsTo, lightBulb_2);
////			array_push(lightBulb_2.inputsFrom, logicGate_2);
			
////			array_push(lightSwitch_3.outputsTo, logicGate_3);
////			array_push(lightSwitch_4.outputsTo, logicGate_3);
////			array_push(logicGate_3.inputsFrom, lightSwitch_3, lightSwitch_4);
////			array_push(logicGate_3.outputsTo, lightBulb_3);
////			array_push(lightBulb_3.inputsFrom, logicGate_3);
			
////			array_push(lightSwitch_5.outputsTo, logicGate_4);
////			array_push(lightSwitch_6.outputsTo, logicGate_4);
////			array_push(logicGate_4.inputsFrom, lightSwitch_5, lightSwitch_6);
////			array_push(logicGate_4.outputsTo, lightBulb_4);
////			array_push(lightBulb_4.inputsFrom, logicGate_4);
			
////			array_push(lightSwitch_7.outputsTo, logicGate_5);
////			array_push(lightSwitch_8.outputsTo, logicGate_5);
////			array_push(logicGate_5.inputsFrom, lightSwitch_7, lightSwitch_8);
////			array_push(logicGate_5.outputsTo, lightBulb_5);
////			array_push(lightBulb_5.inputsFrom, logicGate_5);
			
////			array_push(lightSwitch_9.outputsTo, logicGate_6);
////			array_push(lightSwitch_10.outputsTo, logicGate_6);
////			array_push(logicGate_6.inputsFrom, lightSwitch_9, lightSwitch_10);
////			array_push(logicGate_6.outputsTo, lightBulb_6);
////			array_push(lightBulb_6.inputsFrom, logicGate_6);
////	}
////}

//function load_level_from_data(level_data) {
//    // This empty struct acts as a dictionary to hold our created instances
//    var _instances = {}; 

//    // --- STEP 1: Spawn Components ---
//    for (var i = 0; i < array_length(level_data.components); i++) {
//        var _comp = level_data.components[i];
        
//        // Spawn the object
//        var _inst = instance_create_layer(_comp.x, _comp.y, "Instances", _comp.type);

//        // If it's a logic gate, set its specific type
//        if (_comp.type == obj_logicGate && variable_struct_exists(_comp, "gate_type")) {
//            _inst.set_gateType(_comp.gate_type);
//        }

//        // Save the instance to our dictionary using the string ID
//        // e.g., _instances[$ "sw1"] = 100045 (the actual instance ID)
//        _instances[$ _comp.id] = _inst; 
//    }

//    // --- STEP 2: Wire Connections ---
//    for (var i = 0; i < array_length(level_data.connections); i++) {
//        var _conn = level_data.connections[i];
        
//        // Look up the actual instances from our dictionary
//        var _source = _instances[$ _conn.from];
//        var _target = _instances[$ _conn.to];

//        // Use our helper function to link them
//        connect_nodes(_source, _target);
//    }
//}

//function initialize_circuit(){
//	with(obj_logicGate){
//		update_inputs();
//	}
//	with(obj_lightBulb){
//		update_inputs();
//	}
//}

//level = 2;
//build_level(level);
//initialize_circuit();

// --- FAILSAFE: If testing this room directly ---
if (!variable_global_exists("current_level")) {
    global.current_level = 0; // Default to the first level (index 0)
    global.total_levels = 10;
}
// ----------------------------------------------


// 1. Helper function to connect nodes
function connect_nodes(source_node, target_node) {
    array_push(source_node.outputsTo, target_node);
    array_push(target_node.inputsFrom, source_node);
}

// 2. The data-driven builder function
function load_level_from_data(level_data) {
    var _instances = {}; 

    // Step 1: Spawn Components
    for (var i = 0; i < array_length(level_data.components); i++) {
        var _comp = level_data.components[i];
        var _inst = instance_create_layer(_comp.x, _comp.y, "Instances", _comp.type);

        if (_comp.type == obj_logicGate && variable_struct_exists(_comp, "gate_type")) {
            _inst.set_gateType(_comp.gate_type);
        }

        _instances[$ _comp.id] = _inst; 
    }

    // Step 2: Wire Connections
    for (var i = 0; i < array_length(level_data.connections); i++) {
        var _conn = level_data.connections[i];
        var _source = _instances[$ _conn.from];
        var _target = _instances[$ _conn.to];

        connect_nodes(_source, _target);
    }
}

// 3. Initialize gate inputs function
function initialize_circuit() {
	with(obj_logicGate) {
		update_inputs();
	}
	with(obj_lightBulb) {
		update_inputs();
	}
}

// ==========================================
// 4. EXECUTE THE BUILD
// ==========================================

// Track win state
level_completed = false;
game_beaten = false;

// Get the level data based on the current level variable
// (Note: global.current_level should start at 0 for the first level to match the array index)
var _current_level_data = obj_logicLevels.levels[global.current_level];

// Load and initialize
load_level_from_data(_current_level_data);
initialize_circuit();