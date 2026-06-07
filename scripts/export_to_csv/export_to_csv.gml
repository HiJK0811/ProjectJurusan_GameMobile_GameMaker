function scr_export_csv(_filename)
{
	show_debug_message("=== EXPORT START ===");
show_debug_message("TOTAL DATA: " + string(array_length(global.user_data)));
    // 🔥 WAJIB pakai sandbox (INI YANG BIKIN ERROR KAMU HILANG)
    var path = working_directory + _filename;

    var file = file_text_open_write(path);

    if(file == -1){
        show_debug_message("[ERROR] GAGAL CREATE FILE");
        return;
    }

    // header
    file_text_write_string(file, "Name,Age,Email,Phone,Education,Major\n");

    // data
    for(var i=0;i<array_length(global.user_data);i++){
        var d = global.user_data[i];

        var line = d.name + "," + d.age + "," + d.email + "," +
                   d.phone + "," + d.edu + "," + d.major;

        file_text_write_string(file, line + "\n");
    }

    file_text_close(file);

    show_debug_message("================================");
    show_debug_message("[EXPORT SUCCESS]");
    show_debug_message("FILE: " + path);
    show_debug_message("TOTAL: " + string(array_length(global.user_data)));
    show_debug_message("================================");
}