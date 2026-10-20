var _is_debug_skip = false; // Ubah ke true hanya saat Anda ingin testing cepat

if (_is_debug_skip) {
    room_goto(room_input_data);
} else {
    // Simpan room asal SEBELUM pindah ke room cutscene/input data
    global.previous_room = room; 
    
    // Jalankan cutscene normal terlebih dahulu
    // room_goto(room_cutscene); -> Pindah ke room cutscene di sini
}