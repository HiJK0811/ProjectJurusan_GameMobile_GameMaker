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
    "Export Json",
    "Clear Data",
    "Stress Test x200",
    "Archive",
    "Mini game : sorting",
    "Open Export Folder",
	"input testing"
];

// ================= GLOBAL STORAGE =================
if(!variable_global_exists("user_data")){
    global.user_data = [];
}

// ================= DEBUG =================
global.debug_mode = true;

function debug_log(msg){
    if(global.debug_mode){
        show_debug_message("[DEBUG] " + string(msg));
    }
}

// ================= CLICK COOLDOWN =================
click_cooldown = 0;

// ================= TARGET =================
target = noone;

// ================= EXPORT PATH (SANDBOX AMAN, TANPA SENTUH ROOT DRIVE) =================
global.export_path = working_directory + "SaveGameData/";

if(!directory_exists(global.export_path)){
    directory_create(global.export_path);
    debug_log("Folder dibuat: " + global.export_path);
}

global.last_export_exists = file_exists(global.export_path + "data_export.json");

show_debug_message("[INIT] Export Path: " + global.export_path);