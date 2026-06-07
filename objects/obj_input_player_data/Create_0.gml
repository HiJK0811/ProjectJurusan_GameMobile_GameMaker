// ======================
// GLOBAL UI
// ======================
global.ui_x = display_get_gui_width()/2 - 400;
global.ui_y = display_get_gui_height()/2 - 300;

// ======================
// FONT
// ======================
if(!variable_global_exists("font_main")){
    global.font_main = font_add_sprite(spr_font1, 32, true, 1);
}

// ======================
// GLOBAL INPUT STATE
// ======================
if(!variable_global_exists("focused_input")){
    global.focused_input = noone;
}

// ======================
// GLOBAL FORM DATA (ACTIVE INPUT)
// ======================
global.form = {
    name  : "",
    age   : "",
    email : "",
    phone : "",
    edu   : "",
    major : ""
};

// ======================
// GLOBAL DATABASE (MULTI USER)
// ======================
if(!variable_global_exists("users")){
    global.users = [];
}

// ======================
// GLOBAL CONFIG
// ======================
global.config = {
    max_visible : 5,
    scroll_speed: 15
};

// ======================
// GLOBAL DROPDOWN STATE
// ======================
global.ui_state = {
    edu_open   : false,
    major_open : false,
    scroll     : 0
};

// ======================
// DATA JURUSAN
// ======================
global.majors_SMA = [
    "IPA","IPS","Bahasa"
];

global.majors_SMK = [
    "RPL","TKJ","Multimedia","Akuntansi",
    "Perhotelan","DKV","Animasi","Otomotif","Elektronika"
];

// ======================
// SAVE PATH (FLEXIBLE)
// ======================
global.save_path_csv  = working_directory + "data/users.csv";
global.save_path_json = working_directory + "data/users.json";

// pastikan folder ada
if(!directory_exists(working_directory + "data/")){
    directory_create(working_directory + "data/");
}

// ======================
// DEBUG FLAG
// ======================
global.debug_mode = true;