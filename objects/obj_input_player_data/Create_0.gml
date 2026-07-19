// ================= SAFETY CHECK (WAJIB PALING ATAS) =================
if(!variable_global_exists("ui_state")){
    global.ui_state = {
        gender_open : false,
        edu_open    : false,
        major_open  : false,
        scroll      : 0
    };
}
if(!variable_struct_exists(global.ui_state, "gender_open")){
    global.ui_state.gender_open = false;
}
if(!variable_struct_exists(global.ui_state, "edu_open")){
    global.ui_state.edu_open = false;
}
if(!variable_struct_exists(global.ui_state, "major_open")){
    global.ui_state.major_open = false;
}
if(!variable_struct_exists(global.ui_state, "scroll")){
    global.ui_state.scroll = 0;
}

if(!variable_global_exists("form")){
    global.form = { name:"", age:"", email:"", phone:"", gender:"", edu:"", major:"" };
}
if(!variable_struct_exists(global.form, "gender")){
    global.form.gender = "";
}

if(!variable_global_exists("genders")){
    global.genders = ["Laki-laki","Perempuan"];
}
// ================= FIELD POSITIONS (SESUAIKAN MANUAL) =================
// Urutan sesuai warna: Orange=Name, HijauTua=Age, Biru=LastEdu, Pink=Email, HijauMuda=Phone, Ungu=Gender
global.field_pos = {
    name   : { x: 342, y: 472, w: 170, h: 33 },   // ORANGE
    gender : { x: 368, y: 425, w: 116, h: 33 },   // UNGU
    phone  : { x: 504, y: 420, w: 150, h: 33 },   // HIJAU MUDA/TERANG
    age    : { x: 343, y: 520, w: 155, h: 35 },   // HIJAU TUA
    email  : { x: 179,  y: 660, w: 476, h: 40 },   // PINK
    edu    : { x: 345, y: 570, w: 110, h: 35 },
	major  : { x: 478, y: 580, w: 172, h: 35 } // BIRU (Last-Education)
};

// ================= RESET =================
draw_set_alpha(1);
draw_set_color(c_white);

// ================= SHORTCUT =================
var form = global.form;
var ui   = global.ui_state;

// ... sisanya tetap sama seperti sebelumnya
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
// GLOBAL FORM DATA (tambah gender)
// ======================
global.form = {
    name   : "",
    age    : "",
    email  : "",
    phone  : "",
    gender : "",
    edu    : "",
    major  : ""
};

// ======================
// GLOBAL DROPDOWN STATE (tambah gender_open)
// ======================
global.ui_state = {
    gender_open : false,
    edu_open    : false,
    major_open  : false,
    scroll      : 0
};

// ======================
// DATA GENDER
// ======================
global.genders = ["Laki-laki","Perempuan"];

// ======================
// NAME UNTUK MINIGAME (terpisah dari form, biar gampang dipanggil)
// ======================
if(!variable_global_exists("player_name")){
    global.player_name = "";
}
if(!variable_global_exists("player_gender")){
    global.player_gender = "";
}

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
    "Perhotelan","DKV","Animasi","Otomotif",
    "Elektronika","Tata Busana","Farmasi"
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