/// =====================================================================
/// scr_quest_orientasi.gml
/// Template Utama Pengelolaan Main Quest "md_orientasi"
/// =====================================================================

/// @function init_quest_md_orientasi()
/// @description Menginisialisasi atau mendaftarkan quest md_orientasi ke dalam global.quests
function init_quest_md_orientasi() {
    if (!variable_global_exists("quests") || !is_array(global.quests)) global.quests = [];
    if (quest_get("md_orientasi") != undefined) return;
    var _exists = false;
    for (var i = 0; i < array_length(global.quests); i++) {
        if (variable_struct_exists(global.quests[i], "id") && global.quests[i].id == "md_orientasi") {
            _exists = true;
            break;
        }
    }
    
    if (!_exists) {
        array_push(global.quests, {
            id: "md_orientasi",
            qtype: "main",
            name: "Your first task!!!!",
            desc: "Kenali area sekitar dan orang-orang di dalamnya.",
            steps: [
                { txt: "Jelajahi area check-in & masuk Lounge", done: false }, // Indeks 0
                { txt: "Ngobrol dengan Adhila di Office room (setelah menyelesaikan jukebox!)", done: false },  // Indeks 1
                { txt: "Akses archive di Meeting room", done: false },
				{ txt: "Masuk ke dalam area Storage", done: false }, 
				{ txt: "Menjelajahi area Arcade", done: false },
				{ txt: "mainkan minigame sorting di dalam arcade", done: false },
				{ txt: "Cobalah masuk kedalam ruangan Control room", done: false }
            ],
            completed: false
        });
        show_debug_message("Quest 'md_orientasi' berhasil dimuat dari skrip!");
    }
}


/// @function quest_update_step_md(_step_index)
/// @description Templat siap pakai untuk mencentang langkah (step) tertentu lengkap dengan sound effect-nya
function quest_update_step_md(_step_index) {
    var _q = quest_get("md_orientasi");
    
    if (_q != undefined) {
        if (_step_index >= 0 && _step_index < array_length(_q.steps)) {
            if (!_q.steps[_step_index].done) {
                // Jalankan fungsi bawaan journal untuk mencentang step
                quest_step_done("md_orientasi", _step_index);
                
                // 🔊 Mainkan sound effect checklist yang sudah ditambahkan
                if (audio_exists(snd_checklist_journal)) {
                    audio_play_sound(snd_checklist_journal, 1, false);
                }
                
                show_debug_message("Quest Step ke-" + string(_step_index) + " selesai & sound checklist berbunyi!");
            }
        }
    } else {
        show_debug_message("Error: Quest md_orientasi tidak ditemukan saat mencoba update step!");
    }
}


/// @function quest_complete_md_main()
/// @description Templat siap pakai untuk langsung menyelesaikan seluruh quest md_orientasi
function quest_complete_md_main() {
    var _q = quest_get("md_orientasi");
    
    if (_q != undefined && !_q.completed) {
        for (var i = 0; i < array_length(_q.steps); i++) {
            _q.steps[i].done = true;
        }
        _q.completed = true;
        
        if (audio_exists(snd_Quest_complete)) {
            audio_play_sound(snd_Quest_complete, 1, false);
        }
        
        show_debug_message("Quest Utama 'md_orientasi' SELESAI!");
    }
}