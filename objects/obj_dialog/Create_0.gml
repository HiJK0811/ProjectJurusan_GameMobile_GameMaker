// ========================= CREATE EVENT =========================
speaker_name = "???";
pages        = [""];
options      = undefined;   // array [label, action] atau undefined
page         = 0;
chars        = 0;           // typewriter
type_speed   = 1.2;         // karakter per step
opt_index    = 0;
input_lock   = 5;           // cegah double-input saat dialog baru muncul

// Data kuis (diisi oleh Bekeners saat memulai kuis)
quiz       = undefined;
quiz_owner = noone;

// Palet warna cafe lounge
col_wood   = make_color_rgb(62, 39, 35);     // kayu gelap
col_wood2  = make_color_rgb(93, 64, 55);     // kayu terang
col_cream  = make_color_rgb(243, 229, 208);  // krem susu
col_coffee = make_color_rgb(192, 133, 82);   // aksen kopi/karamel
col_text   = make_color_rgb(43, 29, 20);     // teks coklat tua

reset_page = function() {
    page       = 0;
    chars      = 0;
    opt_index  = 0;
    input_lock = 5;
};

global.dialog_active = true;

