// 🔥 Berikan jeda cooldown interaksi agar tidak langsung terbuka kembali saat tombol konfirmasi ditekan
global.interact_cooldown = 15; 

// Ketika dialog box ditutup / selesai
if (variable_global_exists("active_quest_id") && variable_global_exists("active_step_index")) {
    if (global.active_quest_id != "" && global.active_step_index >= 0
    && script_exists(asset_get_index("update_quest_step_universal"))) {
        update_quest_step_universal(global.active_quest_id, global.active_step_index);

        global.active_quest_id = "";
        global.active_step_index = -1;
    }
}

global.dialog_active = false;