/// =====================================================================
/// scr_journal_system.gml (Perbaikan ID Quest)
/// =====================================================================

// Variabel global penampung data posisi saat load
global.load_data_pending = undefined;

function scr_init_journal() {
    if (!variable_global_exists("quests") || !is_array(global.quests)) {
        global.quests = [];
    }

    if (!variable_global_exists("journal_ready")) {
        global.journal_ready = true;
        global.journal_open = false;
        global.journal_unlocked = true; 
    }

    if (!variable_global_exists("bekeners_collected")) {
        global.bekeners_collected = array_create(global.bekeners_total, false);
    }
}

// ======================= FUNGSI DASAR QUEST =======================

function quest_add(_id, _type, _name, _desc, _steps) {
    var _existing = quest_get(_id);
    if (_existing != undefined) return _existing;

    var _q = {
        id: _id, qtype: _type, name: _name, desc: _desc,
        steps: [], completed: false
    };
    for (var i = 0; i < array_length(_steps); i++) {
        array_push(_q.steps, { txt: _steps[i], done: false });
    }
    array_push(global.quests, _q);

    if (audio_exists(snd_Update_quest)) {
        audio_play_sound(snd_Update_quest, 1, false);
    }

    return _q;
}

function quest_get(_id) {
    for (var i = 0; i < array_length(global.quests); i++) {
        if (global.quests[i].id == _id) return global.quests[i];
    }
    return undefined;
}

function quest_step_done(_id, _idx) {
    var _q = quest_get(_id);
    if (_q != undefined && _idx < array_length(_q.steps)) {
        if (!_q.steps[_idx].done) {
            _q.steps[_idx].done = true;

            if (audio_exists(snd_checklist_journal)) {
                audio_play_sound(snd_checklist_journal, 1, false);
            }

            var _all_done = true;
            for (var i = 0; i < array_length(_q.steps); i++) {
                if (!_q.steps[i].done) {
                    _all_done = false;
                    break;
                }
            }
            if (_all_done) {
                quest_complete(_id);
            }
        }
    }
}

function quest_step_text(_id, _idx, _txt) {
    var _q = quest_get(_id);
    if (_q != undefined && _idx < array_length(_q.steps)) _q.steps[_idx].txt = _txt;
}

function quest_complete(_id) {
    var _q = quest_get(_id);
    if (_q == undefined || _q.completed) return;
    
    _q.completed = true;
    for (var i = 0; i < array_length(_q.steps); i++) {
        _q.steps[i].done = true;
    }

    if (audio_exists(snd_Quest_complete)) {
        audio_play_sound(snd_Quest_complete, 1, false);
    } else if (audio_exists(snd_Update_quest)) {
        audio_play_sound(snd_Update_quest, 1, false);
    }
}

// ========================= SAVE / LOAD =========================

function save_game() {
    var _has_player = (asset_get_index("obj_Player") != -1 && instance_exists(obj_Player));
    var _px = _has_player ? obj_Player.x : 0;
    var _py = _has_player ? obj_Player.y : 0;

    var _data = {
        saved_room        : room, 
        egg_started       : variable_global_exists("egg_started") ? global.egg_started : false,
        egg_completed     : variable_global_exists("egg_completed") ? global.egg_completed : false,
        bekeners_found    : variable_global_exists("bekeners_found") ? global.bekeners_found : 0,
        collected         : variable_global_exists("bekeners_collected") ? global.bekeners_collected : [],
        quests            : variable_global_exists("quests") ? global.quests : [],
        played_cutscenes  : variable_global_exists("played_cutscenes") ? global.played_cutscenes : {},
        journal_unlocked  : variable_global_exists("journal_unlocked") ? global.journal_unlocked : true,
        has_pos           : _has_player,
        px                : _px,
        py                : _py
    };
    
    var _f = file_text_open_write("savegame.json");
    file_text_write_string(_f, json_stringify(_data));
    file_text_close(_f);
    return true;
}

function check_save_exists() {
    return file_exists("savegame.json");
}

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

    global.egg_started         = variable_struct_exists(_data, "egg_started") ? _data.egg_started : false;
    global.egg_completed       = variable_struct_exists(_data, "egg_completed") ? _data.egg_completed : false;
    global.bekeners_found      = variable_struct_exists(_data, "bekeners_found") ? _data.bekeners_found : 0;
    global.bekeners_collected  = variable_struct_exists(_data, "collected") ? _data.collected : [];
    
    if (variable_struct_exists(_data, "played_cutscenes")) {
        global.played_cutscenes = _data.played_cutscenes;
    } else {
        global.played_cutscenes = {};
    }

    if (variable_struct_exists(_data, "quests") && is_array(_data.quests) && array_length(_data.quests) > 0) {
        global.quests = _data.quests;
    } else {
        if (quest_get("md_orientasi") == undefined) {
            quest_add("md_orientasi", "main",
                "Hari Pertama di Kampus",
                "Kenali area sekitar dan orang-orang di dalamnya.",
                [
                    "Jelajahi area check-in & masuk Lounge",
                    "Ngobrol dengan Adhila di Cafe",
                    "Temukan informasi tugas dari Rise"
                ]);
        }
    }

    global.journal_unlocked    = variable_struct_exists(_data, "journal_unlocked") ? _data.journal_unlocked : true;

    global.load_data_pending = {
        has_pos : variable_struct_exists(_data, "has_pos") ? _data.has_pos : false,
        px      : variable_struct_exists(_data, "px") ? _data.px : 100,
        py      : variable_struct_exists(_data, "py") ? _data.py : 100
    };

    if (variable_struct_exists(_data, "saved_room")) {
        room_goto(_data.saved_room);
    }

    return true;
}

// =====================================================================
// HELPER / TRIGGER (ID DISEPAKATI KE "md_orientasi")
// =====================================================================

function check_quest_trigger(_step_index, _target_x, _target_y, _radius = 64) {
    var _q = quest_get("md_orientasi");
    if (_q == undefined) return;
    if (_step_index < 0 || _step_index >= array_length(_q.steps)) return;
    if (_q.steps[_step_index].done) return;
    
    if (instance_exists(asset_get_index("obj_Player"))) {
        var _dist = point_distance(obj_Player.x, obj_Player.y, _target_x, _target_y);
        if (_dist <= _radius) {
            quest_step_done("md_orientasi", _step_index);
        }
    }
}

// =====================================================================
// FUNGSI UNIVERSAL UNTUK UPDATE QUEST
// =====================================================================

function update_quest_step_universal(_quest_id, _step_index) {
    var _q = quest_get(_quest_id);
    
    if (_q != undefined) {
        if (_step_index >= 0 && _step_index < array_length(_q.steps)) {
            if (!_q.steps[_step_index].done) {
                quest_step_done(_quest_id, _step_index);
                show_debug_message("Quest universal berhasil update: " + string(_quest_id) + " step ke-" + string(_step_index));
                return true;
            }
        }
    } else {
        show_debug_message("Warning: Quest ID '" + string(_quest_id) + "' tidak ditemukan!");
    }
    return false;
}

// 🔥 Fungsi untuk mendaftarkan Side Quest Bekeners ke Jurnal
function journal_start_bekeners_quest() {
    // Cek apakah quest side_bekeners sudah ada agar tidak duplikat
    if (quest_get("side_bekeners") != undefined) return;

    // Tambahkan ke sistem jurnal
    quest_add("side_bekeners", "side", 
        "Legenda Para Bekeners", 
        "Temukan 7 Bekeners tersembunyi menggunakan Kaca Pembesar Logika dari Adhila.", 
        [
            "Temukan Bekeners (0/7)",
            "Laporkan kepada Adhila setelah semuanya terkumpul"
        ]
    );
}

// 🔥 Fungsi untuk meng-update teks progres Bekeners di Jurnal
function journal_update_bekeners_progress() {
    var _q = quest_get("side_bekeners");
    if (_q != undefined && array_length(_q.steps) > 0) {
        if (!variable_global_exists("bekeners_found")) global.bekeners_found = 0;
        if (!variable_global_exists("bekeners_total")) global.bekeners_total = 7;
        // Update teks step pertama dengan jumlah terbaru
        _q.steps[0].txt = "Temukan Bekeners (" + string(global.bekeners_found) + "/" + string(global.bekeners_total) + ")";
        
        // Jika sudah 7, centang step pertama otomatis
        if (global.bekeners_found >= global.bekeners_total) {
            quest_step_done("side_bekeners", 0);
        }
    }
}

// 🔥 Fungsi saat quest Bekeners selesai dituntaskan dengan Adhila
function journal_finish_bekeners_quest() {
    quest_complete("side_bekeners");
}