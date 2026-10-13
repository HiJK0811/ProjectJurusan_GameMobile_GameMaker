// ========================= CREATE EVENT (parent) =========================
bek_index      = 0;        // di-override oleh anak (0..6)
found          = false;
visible        = false;    // hanya terlihat saat tersingkap kaca pembesar
interact_range = 55;

/// @func mark_found()
mark_found = function() {
    if (found) return;
    found = true;
    
    // 🔥 Memutar suara saat easter egg ditemukan / diambil
    audio_play_sound(snd_pickup_easteregg, 10, false);
    
    if (variable_global_exists("bekeners_found")) global.bekeners_found += 1;
    if (variable_global_exists("bekeners_collected") && bek_index < array_length(global.bekeners_collected)) {
        global.bekeners_collected[bek_index] = true;
    }
    if (script_exists(journal_update_bekeners_progress)) journal_update_bekeners_progress();
    if (variable_global_exists("bekeners_found") && variable_global_exists("bekeners_total")
    && global.bekeners_found >= global.bekeners_total) {
        global.egg_completed = true;
    }
    instance_destroy();
};