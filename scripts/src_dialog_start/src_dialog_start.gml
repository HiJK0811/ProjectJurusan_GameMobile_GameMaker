function src_dialog_start(_name, _portrait, _dialog, _next_state)
{
    show_debug_message("=== DIALOG START ===");
    show_debug_message("Name = " + _name);
    show_debug_message("Dialog Count = " + string(array_length(_dialog)));
	show_debug_message("Dialog Alive");
	var _caller = id; // simpan instance yang manggil (sebelum masuk instance lain)

    var d = instance_create_layer(
        0,
        0,
        "Instances_1", // atau nama layer instance yang benar
        obj_dialog_minigamesorting
    );

    d.dialog_name = _name;
    d.dialog_portrait = _portrait;
    d.dialog_lines = _dialog;
    d.next_state = _next_state;

    show_debug_message("Instance = " + string(d));

    return d;
}