// ================= SAFETY CHECK & GLOBAL STATE =================

// 1. UI State Dropdown & Scroll
if (!variable_global_exists("ui_state")) {
    global.ui_state = {
        gender_open : false,
        edu_open    : false,
        major_open  : false,
        scroll      : 0
    };
} else {
    if (!variable_struct_exists(global.ui_state, "gender_open")) global.ui_state.gender_open = false;
    if (!variable_struct_exists(global.ui_state, "edu_open"))    global.ui_state.edu_open = false;
    if (!variable_struct_exists(global.ui_state, "major_open"))  global.ui_state.major_open = false;
    if (!variable_struct_exists(global.ui_state, "scroll"))      global.ui_state.scroll = 0;
}

// 2. Global Form Data (Sinkron dengan Supabase)
if (!variable_global_exists("form")) {
    global.form = { 
        name   : "", 
        age    : "", 
        email  : "", 
        phone  : "", 
        gender : "", 
        edu    : "", 
        major  : "" 
    };
} else {
    if (!variable_struct_exists(global.form, "gender")) global.form.gender = "";
}

// 3. Pilihan Data Dropdown
if (!variable_global_exists("genders")) {
    global.genders = ["Laki-laki", "Perempuan"];
}

if (!variable_global_exists("majors_SMA")) {
    global.majors_SMA = ["IPA", "IPS", "Bahasa"];
}

if (!variable_global_exists("majors_SMK")) {
    global.majors_SMK = [
        "RPL", "TKJ", "Multimedia", "Akuntansi",
        "Perhotelan", "DKV", "Animasi", "Otomotif",
        "Elektronika", "Tata Busana", "Farmasi"
    ];
}

// 4. UI Coordinates & Config
global.ui_x = display_get_gui_width() / 2 - 400;
global.ui_y = display_get_gui_height() / 2 - 300;

if (!variable_global_exists("font_main")) {
    global.font_main = font_add_sprite(spr_font1, 32, true, 1);
}

if (!variable_global_exists("focused_input")) {
    global.focused_input = noone;
}

// 5. Field Positions (Posisi Kotak Input di Layar Game)
global.field_pos = {
    name   : { x: 360, y: 476, w: 170, h: 33 },   // ORANGE
    gender : { x: 368, y: 425, w: 116, h: 33 },   // UNGU
    phone  : { x: 504, y: 420, w: 150, h: 33 },   // HIJAU MUDA/TERANG
    age    : { x: 359, y: 520, w: 155, h: 35 },   // HIJAU TUA
    email  : { x: 197, y: 623, w: 476, h: 40 },   // PINK
    edu    : { x: 360, y: 575, w: 110, h: 35 },   // EDU
    major  : { x: 478, y: 580, w: 172, h: 35 }    // MAJOR (Biru)
};


// 6. Global Config
// ================= GLOBAL CONFIG =================
if (!variable_global_exists("config")) {
    global.config = {
        max_visible  : 5,
        scroll_speed : 15
    };
}
global.is_debug = true; // <--- Diubah dari global.debug_mode ke global.is_debug