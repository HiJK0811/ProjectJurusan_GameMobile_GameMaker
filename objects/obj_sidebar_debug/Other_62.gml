// --- MASUKKAN DI ASYNC > HTTP EVENT ---
var _async_id = ds_map_find_value(async_load, "id");

if (variable_global_exists("supabase_req_id") && _async_id == global.supabase_req_id) {
    var _status = ds_map_find_value(async_load, "status");
    var _http_code = ds_map_find_value(async_load, "http_status");
    var _result = ds_map_find_value(async_load, "result");
    
    if (_status == 0) {
        if (_http_code == 201 || _http_code == 200) {
            show_debug_message("[SUPABASE SYNC] Sukses! Data masuk ke database.");
        } else {
            show_debug_message("[SUPABASE ERROR] Code: " + string(_http_code) + " | Respon: " + string(_result));
        }
    } else {
        show_debug_message("[SUPABASE ERROR] Koneksi jaringan gagal.");
    }
}