//==============================
// PLAYER NAME CONFIG
//==============================
keyboard_string = "";

// JANGAN reset global.player_name di sini agar data dari form paspor tetap ada!
// Jika global.player_name kosong (misal dites langsung dari minigame), beri nilai default "Traveler"
if (!variable_global_exists("player_name") || global.player_name == "") {
    global.player_name = "Traveler";
}

// 🔥 REPLACE TAG {player} PADA DIALOG LINES SUPAYA OTOMATIS JADI NAMA ASLI
if (variable_instance_exists(id, "dialog_lines") && is_array(dialog_lines)) {
    for (var i = 0; i < array_length(dialog_lines); i++) {
        dialog_lines[i] = string_replace_all(dialog_lines[i], "{player}", global.player_name);
    }
}

dialog_name = "";
dialog_portrait = spr_portrait_supervisor;
dialog_lines = [];

dialog_index = 0;
typing_name = false;
max_name_length = 15;

text_length = 0;
text_speed = 2;
finished_typing = false;

next_state = -1;
caller = noone;

// GUI
box_x = 20;
box_y = 430;
box_w = 1240;
box_h = 250;

portrait_x = 70;
portrait_y = 120;
portrait_scale = 2;

name_x = 280;
name_y = 455;

text_x = 280;
text_y = 500;

skip_w = 120;
skip_h = 40;
skip_x = box_x + box_w - skip_w - 25;
skip_y = box_y + box_h - skip_h - 20;

next_x = box_x + box_w - 260;
next_y = box_y + box_h - 35;

hover_skip = false;