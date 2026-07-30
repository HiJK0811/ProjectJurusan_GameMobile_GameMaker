// ========================= STEP EVENT =========================
if (input_lock > 0) { input_lock--; exit; }

var _confirm = keyboard_check_pressed(ord("F")) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
var _cur     = pages[page];
var _typing  = (chars < string_length(_cur));
var _last    = (page >= array_length(pages) - 1);
var _showopt = (_last && !_typing && is_array(options));

// Typewriter berjalan
if (_typing) {
    chars += type_speed;
    if (_confirm) chars = string_length(_cur); // skip typewriter
    exit;
}

// Navigasi opsi
if (_showopt) {
    var _n = array_length(options);
    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) opt_index = (opt_index + 1) mod _n;
    if (keyboard_check_pressed(vk_up)   || keyboard_check_pressed(ord("W"))) opt_index = (opt_index - 1 + _n) mod _n;
    if (_confirm) {
        var _act = options[opt_index][1];
        input_lock = 5;
        scr_dialog_action(id, _act);
    }
    exit;
}

// Lanjut halaman / tutup
if (_confirm) {
    if (!_last) {
        page++;
        chars = 0;
    } else if (!is_array(options)) {
        instance_destroy();
    }
}

