
// ================= IMPORT DENGAN DIALOG =================
function scr_import_json_dialog(){
    var _path = get_open_filename("JSON files|*.json", "");

    if(_path == ""){
        show_debug_message("[CANCEL] User membatalkan open dialog");
        return false;
    }

    if(!file_exists(_path)){
        show_debug_message("[ERROR] File tidak ditemukan: " + _path);
        return false;
    }

    var _buffer = buffer_load(_path);
    var _json_string = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);

    global.user_data = json_parse(_json_string);
    show_debug_message("[DEBUG] IMPORT SUKSES, total: " + string(array_length(global.user_data)));
    return true;
}