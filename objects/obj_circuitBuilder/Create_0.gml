moves_made = 0; // Move counter
completion_alpha = 0; // Controls the fade-in transition

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
    
    // Track the outer boundaries of the level
    var _min_x = 99999, _max_x = -99999;
    var _min_y = 99999, _max_y = -99999;

    // --- 1. Spawn Components & Find Boundaries ---
    for (var i = 0; i < array_length(level_data.components); i++) {
        var _comp = level_data.components[i];
        var _inst = instance_create_layer(_comp.x, _comp.y, "Instances", _comp.type);

        if (_comp.type == obj_logicGate && variable_struct_exists(_comp, "gate_type")) {
            _inst.set_gateType(_comp.gate_type);
        }

        _instances[$ _comp.id] = _inst; 
        
        _min_x = min(_min_x, _comp.x);
        _max_x = max(_max_x, _comp.x);
        _min_y = min(_min_y, _comp.y);
        _max_y = max(_max_y, _comp.y);
    }

    // --- 2. Calculate Dynamic Spacing & Scale ---
    var _circuit_w = max(1, _max_x - _min_x);
    var _circuit_h = max(1, _max_y - _min_y);
    
    var _circuit_center_x = _min_x + (_circuit_w / 2);
    var _circuit_center_y = _min_y + (_circuit_h / 2);
    
    var _screen_center_x = room_width / 2;
    var _screen_center_y = room_height / 2;

    // Define the maximum space the circuit is allowed to take up (leaving 100px padding)
    var _max_allowed_w = room_width - 150;
    var _max_allowed_h = room_height - 150;

    // Calculate if we need to squish the spacing to fit the screen
    var _scale_x = _max_allowed_w / _circuit_w;
    var _scale_y = _max_allowed_h / _circuit_h;
    
    // min(1.0) ensures it only shrinks large levels, but keeps small levels at normal spacing
    var _scale = min(1.0, _scale_x, _scale_y);

    // --- 3. Apply the Consistent Spacing ---
    var _keys = variable_struct_get_names(_instances);
    for (var i = 0; i < array_length(_keys); i++) {
        var _inst = _instances[$ _keys[i]];
        
        // Find distance from the center of the circuit
        var _dist_x = _inst.x - _circuit_center_x;
        var _dist_y = _inst.y - _circuit_center_y;
        
        // Scale the distance and move to the exact center of the screen
        _inst.x = _screen_center_x + (_dist_x * _scale);
        _inst.y = _screen_center_y + (_dist_y * _scale);
    }

    // --- 4. Wire Connections ---
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