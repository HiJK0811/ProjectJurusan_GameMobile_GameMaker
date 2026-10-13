var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// ==========================================
// 1. KEYBOARD NAVIGATION
// ==========================================
var _up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

if (_up) {
    index--;
    if (index < 0) index = options_max - 1; 
}

if (_down) {
    index++;
    if (index >= options_max) index = 0; 
}


// ==========================================
// 2. MOUSE NAVIGATION (Sinkron dengan Draw)
// ==========================================
var _m_x = device_mouse_x_to_gui(0);
var _m_y = device_mouse_y_to_gui(0);

var _mouse_moved = (_m_x != last_mouse_x || _m_y != last_mouse_y);
last_mouse_x = _m_x; 
last_mouse_y = _m_y;

for (var i = 0; i < options_max; i++) {
    var _x = _gui_width / 2;
    // 🔥 PENTING: Gunakan rumus _y yang SAMA PERSIS dengan Draw GUI Event (_gui_height / 2.8)
    var _y = (_gui_height / 2.8) + (i * (height + margin));
    
    // Perhitungan kotak hitbox saat hover (memperhitungkan skala _s jika sedang disorot)
    var _s = (index == i) ? 1.1 : 1;
    
    if (_m_x > _x - (width/2) * _s && _m_x < _x + (width/2) * _s &&
        _m_y > _y - (height/2) * _s && _m_y < _y + (height/2) * _s) {
        
        if (_mouse_moved) {
            index = i; 
        }
        
        if (mouse_check_button_pressed(mb_left)) {
            index = i;     
            _select = true; 
        }
    }
}


// ==========================================
// 3. EXECUTE SELECTION
// ==========================================
if (_select) {
    audio_play_sound(snd_click_button, 1, false);
    
    var _is_continue_present = (menu[0] == "Continue");
    
    if (_is_continue_present && index == 0) {
        // --- AKSI CONTINUE ---
        load_game(); // Memuat data game dan otomatis berpindah ke room terakhir
    } 
    else {
        var _adjusted_index = _is_continue_present ? (index - 1) : index;
        
        switch(_adjusted_index) {
    case 0: // Play Game (New Game)
            // 🔥 Hentikan semua suara/musik yang sedang diputar di game
            audio_stop_all(); 
			// Tambahkan baris ini di fungsi New Game Anda
audio_stop_all();
if (instance_exists(obj_musicManager)) {
    obj_musicManager.fadeOutInstances = [];
    obj_musicManager.fadeOutInstanceVolume = [];
    obj_musicManager.fadeOutInstanceTime = [];
    obj_musicManager.songInstance = noone;
    obj_musicManager.songAsset = noone;
}
            if (file_exists("savegame.json")) {
    file_delete("savegame.json");
}
            roomGoToFade(Cutscene_Prolouge);
            break;
        
    case 1: // Tutorial
        room_goto(room_tutorial);
        layer_set_visible("TutorialLayer_Main", true);
        break;
        
    case 2: // Quit Game
        if (!instance_exists(obj_fade_quit)) {
            fadeToQuit(room, 90, c_black);
        }
        break;
}
    }
}