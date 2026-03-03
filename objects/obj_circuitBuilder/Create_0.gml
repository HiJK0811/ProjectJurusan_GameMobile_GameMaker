function build_level(level){
	switch(level){
		case 1:
			var lightSwitch_1 = instance_create_layer(100, 100, "Instances", obj_switch);
			var lightBulb_1 = instance_create_layer(200, 100, "Instances", obj_lightBulb);

			var lightSwitch_2 = instance_create_layer(100, 200, "Instances", obj_switch);
			var lightBulb_2 = instance_create_layer(200, 200, "Instances", obj_lightBulb);

			array_push(lightSwitch_1.outputsTo, lightBulb_1);
			array_push(lightSwitch_2.outputsTo, lightBulb_2);

			array_push(lightBulb_1.inputsFrom, lightSwitch_1);
			array_push(lightBulb_2.inputsFrom, lightSwitch_2);

			var lightSwitch_3	= instance_create_layer(300, 100, "Instances", obj_switch);
			var lightSwitch_4	= instance_create_layer(300, 200, "Instances", obj_switch);
			var logicGate_1		= instance_create_layer(400, 150, "Instances", obj_logicGate);
			var lightBulb_3		= instance_create_layer(500, 150, "Instances", obj_lightBulb);

			logicGate_1.set_gateType(logicGateType.AND);

			array_push(lightSwitch_3.outputsTo, logicGate_1);
			array_push(lightSwitch_4.outputsTo, logicGate_1);

			array_push(logicGate_1.inputsFrom, lightSwitch_3);
			array_push(logicGate_1.inputsFrom, lightSwitch_4);

			array_push(logicGate_1.outputsTo, lightBulb_3);

			array_push(lightBulb_3.inputsFrom, logicGate_1);
		break;
	
		case 2:
			var lightSwitch_1 = instance_create_layer(96, 64, "Instances", obj_switch);
			var lightSwitch_2 = instance_create_layer(384, 64, "Instances", obj_switch);
			var lightSwitch_3 = instance_create_layer(96, 128, "Instances", obj_switch);
			var lightSwitch_4 = instance_create_layer(96, 192, "Instances", obj_switch);
			var lightSwitch_5 = instance_create_layer(384, 128, "Instances", obj_switch);
			var lightSwitch_6 = instance_create_layer(384, 192, "Instances", obj_switch);
			var lightSwitch_7 = instance_create_layer(96, 256, "Instances", obj_switch);
			var lightSwitch_8 = instance_create_layer(96, 320, "Instances", obj_switch);
			var lightSwitch_9 = instance_create_layer(384, 256, "Instances", obj_switch);
			var lightSwitch_10 = instance_create_layer(384, 320, "Instances", obj_switch);
			
			var logicGate_1 = instance_create_layer(160, 64, "Instances", obj_logicGate);
			var logicGate_2 = instance_create_layer(448, 64, "Instances", obj_logicGate);
			var logicGate_3 = instance_create_layer(160, 160, "Instances", obj_logicGate);
			var logicGate_4 = instance_create_layer(448, 160, "Instances", obj_logicGate);
			var logicGate_5 = instance_create_layer(160, 288, "Instances", obj_logicGate);
			var logicGate_6 = instance_create_layer(448, 288, "Instances", obj_logicGate);

			logicGate_1.set_gateType(logicGateType.BUFFER);
			logicGate_2.set_gateType(logicGateType.INVERTER);
			logicGate_3.set_gateType(logicGateType.AND);
			logicGate_4.set_gateType(logicGateType.NAND);
			logicGate_5.set_gateType(logicGateType.OR);
			logicGate_6.set_gateType(logicGateType.NOR);
			
			var lightBulb_1 = instance_create_layer(224, 64, "Instances", obj_lightBulb);
			var lightBulb_2 = instance_create_layer(512, 64, "Instances", obj_lightBulb);
			var lightBulb_3 = instance_create_layer(224, 160, "Instances", obj_lightBulb);
			var lightBulb_4 = instance_create_layer(512, 160, "Instances", obj_lightBulb);
			var lightBulb_5 = instance_create_layer(224, 288, "Instances", obj_lightBulb);
			var lightBulb_6 = instance_create_layer(512, 288, "Instances", obj_lightBulb);
		
			array_push(lightSwitch_1.outputsTo, logicGate_1);
			array_push(logicGate_1.inputsFrom, lightSwitch_1);
			array_push(logicGate_1.outputsTo, lightBulb_1);
			array_push(lightBulb_1.inputsFrom, logicGate_1);
			
			array_push(lightSwitch_2.outputsTo, logicGate_2);
			array_push(logicGate_2.inputsFrom, lightSwitch_2);
			array_push(logicGate_2.outputsTo, lightBulb_2);
			array_push(lightBulb_2.inputsFrom, logicGate_2);
			
			array_push(lightSwitch_3.outputsTo, logicGate_3);
			array_push(lightSwitch_4.outputsTo, logicGate_3);
			array_push(logicGate_3.inputsFrom, lightSwitch_3, lightSwitch_4);
			array_push(logicGate_3.outputsTo, lightBulb_3);
			array_push(lightBulb_3.inputsFrom, logicGate_3);
			
			array_push(lightSwitch_5.outputsTo, logicGate_4);
			array_push(lightSwitch_6.outputsTo, logicGate_4);
			array_push(logicGate_4.inputsFrom, lightSwitch_5, lightSwitch_6);
			array_push(logicGate_4.outputsTo, lightBulb_4);
			array_push(lightBulb_4.inputsFrom, logicGate_4);
			
			array_push(lightSwitch_7.outputsTo, logicGate_5);
			array_push(lightSwitch_8.outputsTo, logicGate_5);
			array_push(logicGate_5.inputsFrom, lightSwitch_7, lightSwitch_8);
			array_push(logicGate_5.outputsTo, lightBulb_5);
			array_push(lightBulb_5.inputsFrom, logicGate_5);
			
			array_push(lightSwitch_9.outputsTo, logicGate_6);
			array_push(lightSwitch_10.outputsTo, logicGate_6);
			array_push(logicGate_6.inputsFrom, lightSwitch_9, lightSwitch_10);
			array_push(logicGate_6.outputsTo, lightBulb_6);
			array_push(lightBulb_6.inputsFrom, logicGate_6);
	}
}

function initialize_circuit(){
	with(obj_logicGate){
		update_inputs();
	}
	with(obj_lightBulb){
		update_inputs();
	}
}

level = 2;
build_level(level);
initialize_circuit();