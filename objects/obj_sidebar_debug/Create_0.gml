// ================= SIDEBAR CONFIG =================
sidebar_w = 260;
sidebar_x = -sidebar_w;
sidebar_open = false;

trigger_w = 20;
sidebar_lerp_speed = 0.2;

// ================= SIDEBAR CONFIG =================
sidebar_w = 260;
sidebar_x = -sidebar_w;
sidebar_open = false;

trigger_w = 20;
sidebar_lerp_speed = 0.2;

// ================= MENU =================
menu_list = [
    "Inject Dummy",
    "Submit Form",
    "Auto Submit x50",
    "Export CSV",
    "Clear Data",
    "Stress Test x200",
	"Archive",
	"Mini game : sorting"
	
];

// ================= GLOBAL STORAGE =================
if(!variable_global_exists("user_data")){
    global.user_data = [];
}

global.debug_mode = true;

// ================= HELPER =================
function debug_log(msg){
    if(global.debug_mode){
        show_debug_message("[DEBUG] " + string(msg));
    }
}

// ================= GLOBAL DATA =================
if(!variable_global_exists("user_data")){
    global.user_data = [];
}

// ================= DEBUG =================
global.debug_mode = true;
for(var i=0;i<array_length(global.user_data);i++){
    var d = global.user_data[i];

    show_debug_message("WRITE: " + d.name);

    var line = d.name + "," + d.age + "," + d.email + "," +
               d.phone + "," + d.edu + "," + d.major;

    file_text_write_string(file, line + "\n");
}

// ================= CLICK COOLDOWN =================
click_cooldown = 0;

// ================= TARGET =================
target = noone;
/// ================= EXPORT PATH DEFAULT =================

// pakai working_directory (PALING AMAN di desktop)
global.export_path = working_directory + "exports/";

// pastikan folder ada
if(!directory_exists(global.export_path)){
    directory_create(global.export_path);
}

// debug
show_debug_message("[INIT] Export Path: " + global.export_path);