function scr_send_to_supabase(_name, _age, _email, _phone, _gender, _edu, _major) {
    var _url = "https://xynpuoobzqsemvtsaueu.supabase.co/rest/v1/game_users";
    var _api_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5bnB1b29ienFzZW12dHNhdWV1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTE1MTY2NjksImV4cCI6MjEwNzA5MjY2OX0.ayW4KhLEVckE0au4V_SsdWUfDVQEviDqpV56V6348xQ";

    // Siapkan header HTTP
    var _header = ds_map_create();
    ds_map_add(_header, "apikey", _api_key);
    ds_map_add(_header, "Authorization", "Bearer " + _api_key);
    ds_map_add(_header, "Content-Type", "application/json");
    ds_map_add(_header, "Prefer", "return=minimal");

    // Data yang dikirim ke Supabase (Pastikan struct keys sama persis dengan nama kolom di tabel Supabase)
    var _data = {
        name   : _name,
        age    : _age,
        email  : _email,
        phone  : _phone,
        gender : _gender,
        edu    : _edu,
        major  : _major
    };

    var _json_string = json_stringify(_data);

    // Kirim request menggunakan http_request
    global.supabase_req_id = http_request(_url, "POST", _header, _json_string);
    
    // Bersihkan memory map agar tidak memory leak
    ds_map_destroy(_header);
}