//// Level 1
//level_0 = {
//	components: [
//        { id: "sw1",   type: obj_switch,    x: 100, y: 150 },
//        { id: "bulb1", type: obj_lightBulb, x: 400, y: 150 }
//    ],
//    connections: [
//        { from: "sw1",  to: "bulb1" }
//    ]
//};

//// Level 2
//level_1 = {
//    components: [
//        { id: "sw1",   type: obj_switch,    x: 100, y: 100 },
//        { id: "sw2",   type: obj_switch,    x: 100, y: 200 },
//        { id: "and1",  type: obj_logicGate, x: 300, y: 150, gate_type: logicGateType.AND },
//        { id: "bulb1", type: obj_lightBulb, x: 500, y: 150 }
//    ],
//    connections: [
//        { from: "sw1",  to: "and1" },
//        { from: "sw2",  to: "and1" },
//        { from: "and1", to: "bulb1" }
//    ]
//};

//// Level 3
//level_2 = {
//    components: [
//        { id: "sw1",   type: obj_switch,    x: 100, y: 100 },
//        { id: "sw2",   type: obj_switch,    x: 100, y: 200 },
//        { id: "or1",   type: obj_logicGate, x: 300, y: 150, gate_type: logicGateType.OR },
//        { id: "bulb1", type: obj_lightBulb, x: 500, y: 150 },

//    ],
//    connections: [
//        // Wire Top Circuit
//        { from: "sw1",  to: "or1" },
//        { from: "sw2",  to: "or1" },
//        { from: "or1",  to: "bulb1" },
//    ]
//};

//// Level 4
//level_3 = {
//    components: [
//        // 4 Switches
//        { id: "sw1",   type: obj_switch,    x: 100, y: 100 },
//        { id: "sw2",   type: obj_switch,    x: 100, y: 200 },
//        { id: "sw3",   type: obj_switch,    x: 100, y: 300 },
//        { id: "sw4",   type: obj_switch,    x: 100, y: 400 },

//        // The 2 OR Gates
//        { id: "or1",   type: obj_logicGate, x: 300, y: 150, gate_type: logicGateType.OR },
//        { id: "or2",   type: obj_logicGate, x: 300, y: 350, gate_type: logicGateType.OR },
        
//        // The Final AND Gate
//        { id: "and1",  type: obj_logicGate, x: 500, y: 250, gate_type: logicGateType.AND },

//        // The Final Bulb
//        { id: "bulb1", type: obj_lightBulb, x: 700, y: 250 }
//    ],
//    connections: [
//        // Wire Top Pair to OR 1
//        { from: "sw1",  to: "or1" },
//        { from: "sw2",  to: "or1" },

//        // Wire Bottom Pair to OR 2
//        { from: "sw3",  to: "or2" },
//        { from: "sw4",  to: "or2" },

//        // Wire both OR gates into the AND gate
//        { from: "or1",  to: "and1" },
//        { from: "or2",  to: "and1" },

//        // Wire AND gate to Bulb
//        { from: "and1", to: "bulb1" }
//    ]
//};

//// STORE THEM IN THE MASTER ARRAY AT THE VERY END
//levels = [level_0, level_1, level_2, level_3];

// ==========================================
// LEVEL 1: Introduction to OR
// ==========================================
level_0 = {
    components: [
        { id: "sw1",   type: obj_switch,    x: 100, y: 100 },
        { id: "sw2",   type: obj_switch,    x: 100, y: 200 },
        { id: "or1",   type: obj_logicGate, x: 300, y: 150, gate_type: logicGateType.OR },
        { id: "bulb1", type: obj_lightBulb, x: 500, y: 150 }
    ],
    connections: [
        { from: "sw1",  to: "or1" },
        { from: "sw2",  to: "or1" },
        { from: "or1",  to: "bulb1" }
    ]
};

// ==========================================
// LEVEL 2: Introduction to AND
// ==========================================
level_1 = {
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

// ==========================================
// LEVEL 3: OR Cascade
// ==========================================
level_2 = {
    components: [
        { id: "sw1",   type: obj_switch,    x: 0, y: 0 },
        { id: "sw2",   type: obj_switch,    x: 0, y: 100 },
        { id: "sw3",   type: obj_switch,    x: 0, y: 200 },
        
        { id: "or1",   type: obj_logicGate, x: 150, y: 50, gate_type: logicGateType.AND },
        { id: "or2",   type: obj_logicGate, x: 300, y: 125, gate_type: logicGateType.OR },
        { id: "bulb1", type: obj_lightBulb, x: 450, y: 125 }
    ],
    connections: [
        { from: "sw1",  to: "or1" },
        { from: "sw2",  to: "or1" },
        
        { from: "or1",  to: "or2" },
        { from: "sw3",  to: "or2" },
        
        { from: "or2",  to: "bulb1" }
    ]
};



// ==========================================
// LEVEL 4: AND Cascade
// ==========================================
level_3 = {
    components: [
        { id: "sw1",   type: obj_switch,    x: 100, y: 100 },
        { id: "sw2",   type: obj_switch,    x: 100, y: 200 },
        { id: "sw3",   type: obj_switch,    x: 100, y: 300 },
        
        { id: "and1",  type: obj_logicGate, x: 300, y: 150, gate_type: logicGateType.AND },
        { id: "and2",  type: obj_logicGate, x: 500, y: 225, gate_type: logicGateType.AND },
        { id: "bulb1", type: obj_lightBulb, x: 700, y: 225 }
    ],
    connections: [
        { from: "sw1",  to: "and1" },
        { from: "sw2",  to: "and1" },
        { from: "and1", to: "and2" },
        { from: "sw3",  to: "and2" },
        { from: "and2", to: "bulb1" }
    ]
};

// ==========================================
// LEVEL 5: OR & AND Combine
// ==========================================
level_4 = {
    components: [
        { id: "sw1",   type: obj_switch,    x: 100, y: 100 },
        { id: "sw2",   type: obj_switch,    x: 100, y: 200 },
        { id: "sw3",   type: obj_switch,    x: 100, y: 300 },
        { id: "sw4",   type: obj_switch,    x: 100, y: 400 },

        { id: "or1",   type: obj_logicGate, x: 300, y: 150, gate_type: logicGateType.OR },
        { id: "or2",   type: obj_logicGate, x: 300, y: 350, gate_type: logicGateType.AND },
        { id: "and1",  type: obj_logicGate, x: 500, y: 250, gate_type: logicGateType.AND },
        { id: "bulb1", type: obj_lightBulb, x: 700, y: 250 }
    ],
    connections: [
        { from: "sw1",  to: "or1" },  { from: "sw2",  to: "or1" },
        { from: "sw3",  to: "or2" },  { from: "sw4",  to: "or2" },
        { from: "or1",  to: "and1" }, { from: "or2",  to: "and1" },
        { from: "and1", to: "bulb1" }
    ]
};

// ==========================================
// LEVEL 6: Inverter OR (Manual NOR)
// ==========================================
level_5 = {
    components: [
        { id: "sw1",   type: obj_switch,    x: 0, y: 0 },
        { id: "sw2",   type: obj_switch,    x: 0, y: 100 },
        
        { id: "pre_not1", type: obj_logicGate, x: 100, y: 0, gate_type: logicGateType.INVERTER },
        { id: "pre_not2", type: obj_logicGate, x: 100, y: 100, gate_type: logicGateType.INVERTER },

        { id: "or1",   type: obj_logicGate, x: 220, y: 50, gate_type: logicGateType.OR },
        { id: "not1",  type: obj_logicGate, x: 340, y: 50, gate_type: logicGateType.INVERTER },
        
        { id: "bulb1", type: obj_lightBulb, x: 460, y: 50 }
    ],
    // Solution: Turn BOTH switches ON
    connections: [
        { from: "sw1",  to: "pre_not1" }, { from: "pre_not1", to: "or1" },
        { from: "sw2",  to: "pre_not2" }, { from: "pre_not2", to: "or1" },
        { from: "or1",  to: "not1" },
        { from: "not1", to: "bulb1" }
    ]
};

// ==========================================
// LEVEL 7: Inverter AND (Manual NAND)
// ==========================================
level_6 = {
    components: [
        { id: "sw1",   type: obj_switch,    x: 0, y: 0 },
        { id: "sw2",   type: obj_switch,    x: 0, y: 100 },
        
        { id: "pre_not1", type: obj_logicGate, x: 100, y: 0, gate_type: logicGateType.INVERTER },
        { id: "pre_not2", type: obj_logicGate, x: 100, y: 100, gate_type: logicGateType.INVERTER },

        { id: "and1",  type: obj_logicGate, x: 220, y: 50, gate_type: logicGateType.AND },
        { id: "not1",  type: obj_logicGate, x: 340, y: 50, gate_type: logicGateType.INVERTER },
        
        { id: "bulb1", type: obj_lightBulb, x: 460, y: 50 }
    ],
    // Solution: Turn EITHER switch ON
    connections: [
        { from: "sw1",  to: "pre_not1" }, { from: "pre_not1", to: "and1" },
        { from: "sw2",  to: "pre_not2" }, { from: "pre_not2", to: "and1" },
        { from: "and1", to: "not1" },
        { from: "not1", to: "bulb1" }
    ]
};

// ==========================================
// LEVEL 8: The NOR Gate
// ==========================================
level_7 = {
    components: [
        { id: "sw1",   type: obj_switch,    x: 0, y: 0 },
        { id: "sw2",   type: obj_switch,    x: 0, y: 100 },
        
        { id: "pre_not1", type: obj_logicGate, x: 100, y: 0, gate_type: logicGateType.INVERTER },
        { id: "pre_not2", type: obj_logicGate, x: 100, y: 100, gate_type: logicGateType.INVERTER },

        { id: "nor1",  type: obj_logicGate, x: 220, y: 50, gate_type: logicGateType.NOR },
        { id: "bulb1", type: obj_lightBulb, x: 340, y: 50 }
    ],
    // Solution: Turn BOTH switches ON
    connections: [
        { from: "sw1",  to: "pre_not1" }, { from: "pre_not1", to: "nor1" },
        { from: "sw2",  to: "pre_not2" }, { from: "pre_not2", to: "nor1" },
        { from: "nor1", to: "bulb1" }
    ]
};

// ==========================================
// LEVEL 9: The NAND Gate
// ==========================================
level_8 = {
    components: [
        { id: "sw1",   type: obj_switch,    x: 0, y: 0 },
        { id: "sw2",   type: obj_switch,    x: 0, y: 100 },
        
        { id: "pre_not1", type: obj_logicGate, x: 100, y: 0, gate_type: logicGateType.INVERTER },
        { id: "pre_not2", type: obj_logicGate, x: 100, y: 100, gate_type: logicGateType.INVERTER },

        { id: "nand1", type: obj_logicGate, x: 220, y: 50, gate_type: logicGateType.NAND },
        { id: "bulb1", type: obj_lightBulb, x: 340, y: 50 }
    ],
    // Solution: Turn EITHER switch ON
    connections: [
        { from: "sw1",  to: "pre_not1" }, { from: "pre_not1", to: "nand1" },
        { from: "sw2",  to: "pre_not2" }, { from: "pre_not2", to: "nand1" },
        { from: "nand1", to: "bulb1" }
    ]
};

// ==========================================
// LEVEL 10: The Masterboard
// ==========================================
// ==========================================
// LEVEL 10: The Masterboard (Supersized & Wide)
// ==========================================
level_9 = {
    components: [
        // Switches (Expanded to 200px vertical gaps)
        { id: "sw1",   type: obj_switch,    x: 0, y: 0 },
        { id: "sw2",   type: obj_switch,    x: 0, y: 200 },
        { id: "sw3",   type: obj_switch,    x: 0, y: 400 },
        { id: "sw4",   type: obj_switch,    x: 0, y: 600 },
        { id: "sw5",   type: obj_switch,    x: 0, y: 800 },
        { id: "sw6",   type: obj_switch,    x: 0, y: 1000 },

        // Layer 1 (Inverters) - Aligned with their source switches
        { id: "not1",  type: obj_logicGate, x: 300, y: 400, gate_type: logicGateType.INVERTER },
        { id: "not2",  type: obj_logicGate, x: 300, y: 800, gate_type: logicGateType.INVERTER },
        { id: "not3",  type: obj_logicGate, x: 300, y: 1000, gate_type: logicGateType.INVERTER },

        // Layer 2 (Primary Logic) - Centered exactly between their inputs
        { id: "and1",  type: obj_logicGate, x: 600, y: 100, gate_type: logicGateType.AND },
        { id: "nor1",  type: obj_logicGate, x: 600, y: 500, gate_type: logicGateType.NOR },
        { id: "nand1", type: obj_logicGate, x: 600, y: 900, gate_type: logicGateType.NAND },

        // Layer 3 (Funneling down) - Centered between AND1 and NOR1
        { id: "and2",  type: obj_logicGate, x: 900, y: 300, gate_type: logicGateType.AND },

        // Final Output - Centered between AND2 and NAND1
        { id: "and3",  type: obj_logicGate, x: 1200, y: 600, gate_type: logicGateType.AND },
        
        // Final Bulb
        { id: "bulb1", type: obj_lightBulb, x: 1500, y: 600 }
    ],
    connections: [
        // Top Path -> AND1
        { from: "sw1",  to: "and1" }, { from: "sw2",  to: "and1" },
        
        // Middle Path -> NOR1
        { from: "sw3",  to: "not1" }, { from: "not1", to: "nor1" },
        { from: "sw4",  to: "nor1" },
        
        // Bottom Path -> NAND1
        { from: "sw5",  to: "not2" }, { from: "not2", to: "nand1" },
        { from: "sw6",  to: "not3" }, { from: "not3", to: "nand1" },

        // Funnel 1
        { from: "and1", to: "and2" }, { from: "nor1", to: "and2" },

        // Final Funnel
        { from: "and2", to: "and3" }, { from: "nand1", to: "and3" },

        // To Win
        { from: "and3", to: "bulb1" }
    ]
};

// ==========================================
// COMPILE THE ARRAY
// ==========================================
levels = [level_0, level_1, level_2, level_3, level_4, level_5, level_6, level_7, level_8, level_9];
