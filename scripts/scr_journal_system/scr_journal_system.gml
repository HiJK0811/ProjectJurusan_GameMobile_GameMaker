/// =====================================================================
/// scr_journal_system.gml
/// Sistem Journal: quest (main/side), koleksi Bekeners + lore, save/load.
/// Panggil scr_init_journal() di obj_game_controller SETELAH scr_init_game_data().
/// =====================================================================

function scr_init_journal() {
    if (variable_global_exists("journal_ready")) return;
    global.journal_ready = true;

    global.journal_open = false;
    global.quests       = [];   // daftar quest aktif/selesai

    // Koleksi Bekeners (true = sudah ditemukan), urut sesuai bek_index 0-6
    global.bekeners_collected = array_create(global.bekeners_total, false);

    // Lore tiap Bekeners — tampil di journal setelah ditemukan
    global.bekeners_lore = [
        "Penjaga ilmu penyimpanan. Konon ia lahir dari kotak kayu berlabel milik mahasiswa angkatan pertama yang selalu berkata: 'Semua nilai butuh rumah.'",
        "Penjaga bilangan bulat. Ia tak pernah mau dibagi menjadi pecahan; baginya, keutuhan adalah kehormatan.",
        "Penjaga kebenaran dan kesalahan. Matanya bisa melihat dua sisi dari segala hal, tapi lidahnya hanya mengucap BENAR atau SALAH.",
        "Penjaga keteraturan. Ia percaya pekerjaan besar hanyalah kumpulan pekerjaan kecil yang dipanggil berulang kali.",
        "Penjaga bahasa mesin. Setiap malam ia menulis mantra-mantra kecil yang esok paginya menjadi dunia.",
        "Penjaga siklus. Ia tahu segala karya lahir dari memahami, merancang, membangun, menguji... lalu memulai lagi.",
        "Sang pemimpin. Perwujudan semangat Computer Science itu sendiri. Ia hanya menampakkan diri pada pencari yang haus ilmu — dan kau telah membuktikannya."
    ];

    // =================================================================
    // DAFTAR QUEST
    // -----------------------------------------------------------------
    // CARA MENAMBAH QUEST BARU: copy blok quest_add di bawah, ganti
    // isinya, lalu update progresnya dari mana saja dengan:
    //   quest_step_done("id_quest", nomor_langkah);   // centang langkah
    //   quest_complete("id_quest");                    // tandai selesai
    // Tipe quest: "main" atau "side"
    // =================================================================

    // ---- TEMPLATE MAIN QUEST (hapus /* */ untuk mengaktifkan) ----
    /*
    quest_add("mq_orientasi", "main",
        "Hari Pertama di Kampus",
        "Kenali area sekitar dan orang-orang di dalamnya.",
        [
            "Jelajahi cafe lounge",
            "Ngobrol dengan Adhila",
            "Temukan papan informasi"
        ]);
    */

    // Side quest "Legenda Para Bekeners" TIDAK didaftarkan di sini —
    // ia muncul otomatis di journal saat pemain setuju berburu
    // (lihat journal_start_bekeners_quest, dipanggil dari "start_hunt").
}

// ======================= FUNGSI DASAR QUEST =======================

/// @func quest_add(_id, _type, _name, _desc, _steps)
function quest_add(_id, _type, _name, _desc, _steps) {
    var _q = {
        id: _id, qtype: _type, name: _name, desc: _desc,
        steps: [], completed: false
    };
    for (var i = 0; i < array_length(_steps); i++) {
        array_push(_q.steps, { txt: _steps[i], done: false });
    }
    array_push(global.quests, _q);
    return _q;
}

/// @func quest_get(_id)
function quest_get(_id) {
    for (var i = 0; i < array_length(global.quests); i++) {
        if (global.quests[i].id == _id) return global.quests[i];
    }
    return undefined;
}

/// @func quest_step_done(_id, _idx)  — centang langkah ke-_idx (mulai dari 0)
function quest_step_done(_id, _idx) {
    var _q = quest_get(_id);
    if (_q != undefined && _idx < array_length(_q.steps)) _q.steps[_idx].done = true;
}

/// @func quest_step_text(_id, _idx, _txt) — ganti teks langkah (utk counter dsb)
function quest_step_text(_id, _idx, _txt) {
    var _q = quest_get(_id);
    if (_q != undefined && _idx < array_length(_q.steps)) _q.steps[_idx].txt = _txt;
}

/// @func quest_complete(_id)
function quest_complete(_id) {
    var _q = quest_get(_id);
    if (_q == undefined) return;
    _q.completed = true;
    for (var i = 0; i < array_length(_q.steps); i++) _q.steps[i].done = true;
}

// ============== HOOK SIDE QUEST: LEGENDA PARA BEKENERS ==============

function journal_start_bekeners_quest() {
    if (quest_get("sq_bekeners") != undefined) return;
    quest_add("sq_bekeners", "side",
        "Legenda Para Bekeners",
        "Adhila menceritakan legenda tujuh penjaga ilmu yang bersembunyi di area ini. Temukan mereka dengan Kaca Pembesar Logika.",
        [
            "Dengarkan legenda dari Adhila",
            "Terima Kaca Pembesar Logika",
            "Temukan ketujuh Bekeners (0/7)",
            "Laporkan penemuanmu pada Adhila"
        ]);
    quest_step_done("sq_bekeners", 0);
    quest_step_done("sq_bekeners", 1);
}

function journal_update_bekeners_progress() {
    var _q = quest_get("sq_bekeners");
    if (_q == undefined) return;
    quest_step_text("sq_bekeners", 2,
        "Temukan ketujuh Bekeners (" + string(global.bekeners_found) + "/" + string(global.bekeners_total) + ")");
    if (global.bekeners_found >= global.bekeners_total) quest_step_done("sq_bekeners", 2);
}

function journal_finish_bekeners_quest() {
    quest_step_done("sq_bekeners", 3);
    quest_complete("sq_bekeners");
}

// ========================= SAVE / LOAD =========================
// File tersimpan sebagai "savegame.json" di folder save GameMaker
// (%LocalAppData%\<NamaGame>\ di Windows).

/// @func save_game()
function save_game() {
    var _data = {
        egg_started    : global.egg_started,
        egg_completed  : global.egg_completed,
        bekeners_found : global.bekeners_found,
        collected      : global.bekeners_collected,
        quests         : global.quests,
        has_pos        : instance_exists(obj_player),
        px             : instance_exists(obj_player) ? obj_player.x : 0,
        py             : instance_exists(obj_player) ? obj_player.y : 0
    };
    var _f = file_text_open_write("savegame.json");
    file_text_write_string(_f, json_stringify(_data));
    file_text_close(_f);
    return true;
}

/// @func load_game()
function load_game() {
    if (!file_exists("savegame.json")) return false;

    var _f = file_text_open_read("savegame.json");
    var _s = "";
    while (!file_text_eof(_f)) {
        _s += file_text_read_string(_f);
        file_text_readln(_f);
    }
    file_text_close(_f);

    var _data = json_parse(_s);

    global.egg_started        = _data.egg_started;
    global.egg_completed      = _data.egg_completed;
    global.bekeners_found     = _data.bekeners_found;
    global.bekeners_collected = _data.collected;
    global.quests             = _data.quests;

    // Hapus Bekeners yang sudah pernah ditemukan
    with (obj_bekeners_parent) {
        if (variable_instance_exists(id, "bek_index")
        &&  global.bekeners_collected[bek_index]) {
            instance_destroy();
        }
    }

    // Munculkan kaca pembesar bila perburuan sudah dimulai
    if (global.egg_started && !instance_exists(obj_magnifying) && instance_exists(obj_player)) {
        instance_create_depth(obj_player.x, obj_player.y, -5000, obj_magnifying);
    }

    // Kembalikan posisi player
    if (_data.has_pos && instance_exists(obj_player)) {
        obj_player.x = _data.px;
        obj_player.y = _data.py;
    }

    return true;
}
