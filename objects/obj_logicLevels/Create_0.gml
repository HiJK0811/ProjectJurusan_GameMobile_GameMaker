//levels = [level_0, level_1]

//level_0 = {
//	components: [
	
	
//	],
//	connections: [
	
	
//	]
//}

// 1. Define Level 0 (A simple AND gate circuit)
level_0 = {
    components: [
        { id: "sw1",   type: obj_switch,    x: 100, y: 100 },
        { id: "sw2",   type: obj_switch,    x: 100, y: 200 },
        { id: "and1",  type: obj_logicGate, x: 300, y: 150, gate_type: logicGateType.AND },
        { id: "bulb1", type: obj_lightBulb, x: 500, y: 150 }
    ],
    connections: [
        { from: "sw1",  to: "and1" },
        { from: "sw2",  to: "and1" },
        { from: "and1", to: "bulb1" }
    ]
};

// 2. Define Level 1 (A simple direct connection for testing)
level_1 = {
    components: [
        { id: "sw1",   type: obj_switch,    x: 100, y: 150 },
        { id: "bulb1", type: obj_lightBulb, x: 400, y: 150 }
    ],
    connections: [
        { from: "sw1",  to: "bulb1" }
    ]
};

// 3. STORE THEM IN THE MASTER ARRAY AT THE VERY END
levels = [level_0, level_1];
