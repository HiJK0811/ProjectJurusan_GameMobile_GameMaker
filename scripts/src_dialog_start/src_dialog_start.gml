function src_dialog_start(_name, _portrait, _dialog, _next_state)
{
    show_debug_message("=== DIALOG START ===");
    
    var _caller = id; 

    var d = instance_create_layer(
        0,
        0,
        "Instances_1", 
        obj_dialog_minigamesorting
    );

    d.dialog_name     = _name;
    d.dialog_portrait = _portrait;
    
    // Ambil nama player
    var p_name = (variable_global_exists("player_name") && global.player_name != "") ? global.player_name : "Traveler";
    
    // Duplikasi array dialog dan replace {player} di dalamnya
    var processed_dialog = [];
    for(var i = 0; i < array_length(_dialog); i++) {
        array_push(processed_dialog, string_replace_all(_dialog[i], "{player}", p_name));
    }
    
    d.dialog_lines    = processed_dialog;
    d.next_state      = _next_state;
    d.caller          = _caller; 

    return d;
}