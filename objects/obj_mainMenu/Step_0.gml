var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// ==========================================
// 1. KEYBOARD & VIRTUAL CONTROLLER NAVIGATION (AMAN DARI ERROR)
// ==========================================
// Cek apakah variabel global sudah ada sebelum dibaca untuk mencegah crash
var v_up_pressed   = (variable_global_exists("v_up") && global.v_up);
var v_down_pressed = (variable_global_exists("v_down") && global.v_down);
var v_a_pressed    = (variable_global_exists("v_a") && global.v_a);

var _up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || v_up_pressed;
var _down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || v_down_pressed;
var _select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || v_a_pressed;

if (_up) {
    index--;
    if (index < 0) index = options_max - 1; // Wrap around to bottom
}

if (_down) {
    index++;
    if (index >= options_max) index = 0; // Wrap around to top
}

// ==========================================
// 2. MOUSE & TOUCH NAVIGATION (DISESUAIKAN DENGAN KOTAK ATAS)
// ==========================================
// Ambil posisi sentuhan jari pada perangkat mobile / mouse
var _m_x = device_mouse_x_to_gui(0);
var _m_y = device_mouse_y_to_gui(0);

// Cek apakah sentuhan berada di dalam area "kotak game" bagian atas
// (Menggunakan variabel global yang kita lempar dari obj_mobile_controller)
var inside_game_screen = true;
if (variable_global_exists("game_draw_x")) {
    inside_game_screen = (_m_x >= global.game_draw_x && _m_x <= global.game_draw_x + global.game_draw_w &&
                          _m_y >= global.game_draw_y && _m_y <= global.game_draw_y + global.game_draw_h);
}

// Check if the mouse/touch actually moved this frame
var _mouse_moved = (_m_x != last_mouse_x || _m_y != last_mouse_y);
last_mouse_x = _m_x; 
last_mouse_y = _m_y;

for (var i = 0; i < options_max; i++) {
    var _x = _gui_width / 2;
    var _y = (_gui_height / 2) + (i * (height + margin));
    
    // Cek hover tombol (hanya aktif jika sentuhan berada di dalam kotak layar game atas)
    if (inside_game_screen && (_m_x > _x - width/2 && _m_x < _x + width/2 &&
        _m_y > _y - height/2 && _m_y < _y + height/2)) {
        
        if (_mouse_moved) {
            index = i; 
        }
        
        // Jika layar disentuh/diklik di dalam area tombol menu
        if (mouse_check_button_pressed(mb_left) || device_mouse_check_button_pressed(0, mb_left)) {
            index = i;     
            _select = true; 
        }
    }
}


// ==========================================
// 3. EXECUTE SELECTION (TETAP SAMA)
// ==========================================
if (_select) {
    audio_play_sound(snd_click_button, 1, false);
            
    switch(index) {
        case 0: // Start
            roomGoToFade(room_explore_checkIn);
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