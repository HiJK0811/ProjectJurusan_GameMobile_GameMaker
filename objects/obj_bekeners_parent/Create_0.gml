// ========================= CREATE EVENT (parent) =========================
bek_index      = 0;        // di-override oleh anak (0..6)
found          = false;
visible        = false;    // hanya terlihat saat tersingkap kaca pembesar
interact_range = 40;

/// @func mark_found()
mark_found = function() {
    if (found) return;
    found = true;
    global.bekeners_found += 1;
    global.bekeners_collected[bek_index] = true;      // <-- baris ini
    journal_update_bekeners_progress();               // <-- dan ini
    if (global.bekeners_found >= global.bekeners_total) {
        global.egg_completed = true;
    }
    instance_destroy();
};