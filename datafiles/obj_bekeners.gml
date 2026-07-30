/// =====================================================================
/// obj_bekeners_parent  (parent dari 7 object Bekeners, TANPA sprite)
/// Tersembunyi (visible = false) sampai tersingkap oleh kaca pembesar.
/// Dekati + tekan [E] untuk memulai kuis pilihan ganda.
/// =====================================================================

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
    if (global.bekeners_found >= global.bekeners_total) {
        global.egg_completed = true;
    }
    instance_destroy();    // Bekeners "ikut" bersamamu setelah ditemukan
};

// ========================= STEP EVENT (parent) =========================
if (found || !visible) exit;
if (global.dialog_active) exit;
if (!global.egg_started) { visible = false; exit; }
if (!instance_exists(obj_player)) exit;

if (point_distance(x, y, obj_player.x, obj_player.y) <= interact_range
&&  keyboard_check_pressed(ord("E"))) {

    var _data = global.bekeners_data[bek_index];
    var _pages = [
        "Waa! Kamu bisa melihatku?! Berarti legenda pencari itu benar!",
        "Perkenalkan, aku " + _data.name + "! Sebelum kamu kubiarkan lanjut, jawab dulu pertanyaanku ya~",
        _data.question
    ];
    var _opts = [];
    for (var i = 0; i < array_length(_data.options); i++) {
        array_push(_opts, [chr(ord("A") + i) + ". " + _data.options[i], "answer_" + string(i)]);
    }

    var _d = dialog_show(_data.name, _pages, _opts);
    _d.quiz       = _data;
    _d.quiz_owner = id;
}

// ========================= DRAW EVENT (parent) =========================
if (!visible) exit;
// Efek berkilau lembut saat tersingkap
image_alpha = 0.75 + 0.25 * sin(current_time / 180);
draw_self();
image_alpha = 1;

if (instance_exists(obj_player)
&&  point_distance(x, y, obj_player.x, obj_player.y) <= interact_range) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_black);
    draw_text(x + 1, y - sprite_height - 3, "[E] Sapa");
    draw_set_color(c_yellow);
    draw_text(x, y - sprite_height - 4, "[E] Sapa");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

/// =====================================================================
/// 7 OBJECT ANAK — parent = obj_bekeners_parent
/// Masing-masing HANYA butuh Create Event berikut
/// (event_inherited() menjalankan Create parent dulu).
/// =====================================================================

// ---------- obj_bekeners_variable : CREATE ----------
event_inherited();
bek_index    = 0;
sprite_index = spr_Bekeners;      // biru

// ---------- obj_bekeners_integers : CREATE ----------
event_inherited();
bek_index    = 1;
sprite_index = spr_Bekeners_1;    // hijau

// ---------- obj_bekeners_logic : CREATE ----------
event_inherited();
bek_index    = 2;
sprite_index = spr_Bekeners_2;    // merah

// ---------- obj_bekeners_function : CREATE ----------
event_inherited();
bek_index    = 3;
sprite_index = spr_Bekeners_3;    // pink

// ---------- obj_bekeners_code : CREATE ----------
event_inherited();
bek_index    = 4;
sprite_index = spr_Bekeners_4;    // kuning/emas

// ---------- obj_bekeners_sdlc : CREATE ----------
event_inherited();
bek_index    = 5;
sprite_index = spr_Bekeners_5;    // ungu

// ---------- obj_bekeners_cs (LEADER) : CREATE ----------
event_inherited();
bek_index    = 6;
sprite_index = spr_Bekeners_6;    // oranye (pemimpin)
