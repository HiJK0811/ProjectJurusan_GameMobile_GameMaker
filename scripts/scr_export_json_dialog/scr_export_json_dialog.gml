// ================= EXPORT DENGAN DIALOG (BISA PILIH D:/ MANUAL) =================
function scr_export_json_dialog(){
    if(array_length(global.user_data) == 0){
        show_debug_message("[WARNING] NO DATA");
        return;
    }

    var _path = get_save_filename("JSON files|*.json", "data_export.json");

    if(_path == ""){
        show_debug_message("[CANCEL] User membatalkan save dialog");
        return;
    }

    var _json_string = json_stringify(global.user_data);
    var _buffer = buffer_create(string_byte_length(_json_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _json_string);
    buffer_save(_buffer, _path);
    buffer_delete(_buffer);

    global.last_export_path = _path;
    global.last_export_exists = file_exists(_path);

    show_debug_message("[DEBUG] EXPORT JSON SUKSES -> " + _path);
}
