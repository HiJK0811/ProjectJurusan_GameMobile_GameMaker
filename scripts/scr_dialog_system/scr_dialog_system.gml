/// =====================================================================
/// scr_dialog_system.gml
/// Mesin dialog: pembuka dialog, menu Adhila, lore legenda, dan kuis.
/// =====================================================================

/// @func dialog_show(_speaker, _pages, _options)
/// @desc Membuka kotak dialog. _pages = array string, _options = array [label, action] (boleh undefined)
function dialog_show(_speaker, _pages, _options) {
    if (instance_exists(obj_dialog)) instance_destroy(obj_dialog);
    var _d = instance_create_depth(0, 0, -9999, obj_dialog);
    _d.speaker_name = _speaker;
    _d.pages        = _pages;
    _d.options      = _options;   // undefined = tidak ada pilihan, dialog tutup di akhir
    _d.reset_page();
    global.dialog_active = true;
    return _d;
}

/// @func scr_adhila_menu()
/// @desc Menyusun pilihan obrolan Adhila (3 topik + trigger easter egg + tutup)
function scr_adhila_menu() {
    var _m = [];
    array_push(_m, ["Cerita dong, BINUS University itu seperti apa?",                 "binus_umum"]);
    array_push(_m, ["Jurusan Computer Science - Software Engineering belajar apa?",  "binus_cs"]);
    array_push(_m, ["Gimana rasanya kuliah di sana? Prospek kariernya?",             "binus_karier"]);

    // Trigger easter egg (berubah sesuai progres)
    if (!global.egg_started) {
        array_push(_m, ["Ngomong-ngomong... apakah ada legenda di area sini?",       "legend"]);
    } else if (!global.egg_completed) {
        array_push(_m, ["Soal legenda Bekeners... boleh minta petunjuk?",            "hint"]);
    } else {
        array_push(_m, ["Adhila! Aku sudah menemukan ketujuh Bekeners!",             "finale"]);
    }

    array_push(_m, ["Sudah dulu, terima kasih ya!", "close"]);
    return _m;
}

/// @func scr_dialog_action(_d, _act)
/// @desc Menangani aksi ketika sebuah opsi dipilih. _d = instance obj_dialog
function scr_dialog_action(_d, _act) {

    // ---------- Jawaban kuis Bekeners: "answer_0" .. "answer_3" ----------
    if (string_copy(_act, 1, 7) == "answer_") {
        var _idx  = real(string_delete(_act, 1, 7));
        var _quiz = _d.quiz;
        var _pg   = [];
        if (_idx == _quiz.correct) {
            array_push(_pg, "Yeay, BENAR! Kamu memang calon Binusian sejati!");
            array_push(_pg, "Sebagai hadiahnya, terimalah Lencana " + _quiz.name + "!");
        } else {
            array_push(_pg, "Hmm, belum tepat... tapi tenang, kamu tetap dapat lencananya kok!");
            array_push(_pg, "Biar makin paham: " + _quiz.edu);
            array_push(_pg, "Sekarang, terimalah Lencana " + _quiz.name + "!");
        }
        _d.pages   = _pg;
        _d.options = [["Terima kasih, Bekeners!", "quiz_done"]];
        _d.reset_page();
        return;
    }

    switch (_act) {

        // ================= UMUM =================
        case "close":
            instance_destroy(_d);
            break;

        case "menu":
            _d.speaker_name = "Adhila";
            _d.pages   = ["Ada lagi yang mau kamu tanyakan? Santai aja, anggap kita lagi ngopi bareng, hehe."];
            _d.options = scr_adhila_menu();
            _d.reset_page();
            break;

        // ================= TOPIK BINUS =================
        case "binus_umum":
            _d.pages = [
                "BINUS University itu salah satu universitas swasta di Indonesia yang dikenal kuat banget di bidang teknologi informasi.",
                "Awalnya berdiri tahun 1974 sebagai lembaga kursus komputer, terus berkembang jadi universitas dengan banyak kampus.",
                "Yang aku suka, komunitasnya erat. Semua mahasiswa, alumni, sampai dosen disebut 'Binusian'. Sekali Binusian, tetap Binusian!",
                "Fasilitas dan kurikulumnya juga selalu ngikutin perkembangan industri, jadi lulusannya siap kerja."
            ];
            _d.options = [["Tanya yang lain", "menu"], ["Cukup, terima kasih!", "close"]];
            _d.reset_page();
            break;

        case "binus_cs":
            _d.pages = [
                "Nah, ini jurusanku! Computer Science dengan fokus Software Engineering.",
                "Di sini kamu belajar dasar-dasar ilmu komputer: algoritma, struktur data, logika, sampai matematika komputasi.",
                "Terus makin dalam ke dunia software: pemrograman berbagai bahasa, desain software, database, sampai SDLC alias siklus pengembangan perangkat lunak.",
                "Serunya, banyak project nyata. Kamu nggak cuma teori, tapi beneran bikin aplikasi bareng tim, pakai metode kayak Agile.",
                "Cocok banget buat kamu yang suka memecahkan masalah dan pengen jadi software engineer andal!"
            ];
            _d.options = [["Tanya yang lain", "menu"], ["Cukup, terima kasih!", "close"]];
            _d.reset_page();
            break;

        case "binus_karier":
            _d.pages = [
                "Kuliahnya seru tapi menantang! Tugasnya banyak, tapi justru itu yang bikin skill kita terasah.",
                "Ada juga program enrichment, jadi sebelum lulus kamu bisa magang di industri, riset, wirausaha, atau bahkan pengalaman ke luar negeri.",
                "Prospek kariernya luas: software engineer, backend/frontend developer, mobile developer, game developer, data engineer, dan masih banyak lagi.",
                "Aku sendiri sudah lulus, dan pengalaman di sana kepakai banget di dunia kerja. Makanya sekarang aku semangat promosiin ke kalian, hehe."
            ];
            _d.options = [["Tanya yang lain", "menu"], ["Cukup, terima kasih!", "close"]];
            _d.reset_page();
            break;

        // ================= EASTER EGG: LORE LEGENDA =================
        case "legend":
            _d.pages = [
                "Eh? Legenda...? Hihi, ternyata kamu peka juga ya.",
                "Baiklah, akan kuceritakan. Konon, jauh sebelum lounge ini seramai sekarang, ada tujuh makhluk kecil penjaga ilmu yang disebut... para BEKENERS.",
                "Mereka lahir dari semangat para mahasiswa Computer Science angkatan pertama. Setiap Bekeners menjaga satu ilmu: Variable, Integers, Logic, Function, Code, SDLC...",
                "...dan sang pemimpin, Bekeners Computer Science, yang katanya hanya menampakkan diri pada mereka yang sungguh-sungguh ingin belajar.",
                "Suatu hari mereka bersembunyi, menyebar di sekitar area ini. Kata orang, mereka menunggu seorang 'pencari' yang mau menemukan mereka satu per satu.",
                "Mata biasa tak bisa melihat mereka. Kamu butuh ini... Kaca Pembesar Logika! Pusaka turun-temurun para Binusian, hihi.",
                "Kaca ini hanya kuat menyala selama 35 detik, lalu butuh istirahat sebentar sebelum bisa dipakai lagi. Gunakan dengan bijak ya!",
                "Bagaimana? Mau mencoba menemukan ketujuh Bekeners dan membuktikan legendanya?"
            ];
            _d.options = [
                ["Ayo mulai berburu!",       "start_hunt"],
                ["Nanti dulu deh, hehe...",  "menu"]
            ];
            _d.reset_page();
            break;

        case "start_hunt":
            global.egg_started = true;
            if (!instance_exists(obj_magnifying) && instance_exists(obj_player)) {
                instance_create_depth(obj_player.x, obj_player.y, -5000, obj_magnifying);
            }
            _d.pages = [
                "Kaca Pembesar Logika sudah kuberikan padamu!",
                "Tekan tombol [F] untuk menyalakannya. Area 9x9 di sekitarmu akan tersingkap dan mengikuti ke mana pun kamu bergerak.",
                "Ingat: hanya 35 detik sekali nyala, lalu cooldown sebentar. Kalau menemukan Bekeners, dekati dan tekan [E] untuk menyapanya.",
                "Setiap Bekeners akan mengujimu dengan satu pertanyaan. Jangan takut salah, mereka baik kok. Selamat berburu, pencari legenda!"
            ];
            _d.options = [["Siap! Berangkat!", "close"]];
            _d.reset_page();
            break;

        case "hint":
            var _sisa = global.bekeners_total - global.bekeners_found;
            _d.pages = [
                "Sejauh ini kamu sudah menemukan " + string(global.bekeners_found) + " dari " + string(global.bekeners_total) + " Bekeners. Tinggal " + string(_sisa) + " lagi!",
                "Coba telusuri sudut-sudut yang jarang dilewati orang. Bekeners suka tempat yang tenang.",
                "Saat kaca pembesar menyala, perhatikan 'suhu' penunjuknya. Makin panas, makin dekat!"
            ];
            _d.options = [["Oke, lanjut berburu!", "close"], ["Tanya yang lain", "menu"]];
            _d.reset_page();
            break;

        case "finale":
            _d.pages = [
                "Kamu... benar-benar menemukan ketujuhnya?! Bahkan sang pemimpin, Bekeners Computer Science?!",
                "Luar biasa! Legenda itu ternyata benar. Para Bekeners hanya menampakkan diri pada pencari sejati yang haus ilmu.",
                "Kamu sudah membuktikan punya rasa ingin tahu, logika, dan kegigihan. Itu modal utama seorang software engineer!",
                "Selamat, Sang Pencari Legenda! Semoga suatu hari kita bertemu lagi... sebagai sesama Binusian. Hihi!"
            ];
            _d.options = [["Terima kasih, Adhila!", "close"]];
            _d.reset_page();
            break;

        // ================= KUIS SELESAI =================
        case "quiz_done":
            if (_d.quiz_owner != noone && instance_exists(_d.quiz_owner)) {
                with (_d.quiz_owner) mark_found();
            }
            // Jika baru saja lengkap 7, kasih notifikasi arahan
            if (global.bekeners_found >= global.bekeners_total) {
                _d.speaker_name = "???";
                _d.pages   = ["Ketujuh Bekeners telah ditemukan! Kembalilah pada Adhila untuk menuntaskan legenda ini..."];
                _d.options = [["Kembali ke Adhila!", "close"]];
                _d.quiz_owner = noone;
                _d.reset_page();
            } else {
                instance_destroy(_d);
            }
            break;

        default:
            instance_destroy(_d);
            break;
    }
}
