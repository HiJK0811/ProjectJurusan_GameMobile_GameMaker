// ========================= STEP EVENT =========================
if (global.dialog_active) exit;
if (!instance_exists(obj_player)) exit;

var _near = (point_distance(x, y, obj_player.x, obj_player.y) <= interact_range);

if (_near && keyboard_check_pressed(ord("E"))) {
    // Quote acak dari data bank sebelum masuk ke pilihan obrolan
    var _q     = global.adhila_quotes[irandom(array_length(global.adhila_quotes) - 1)];
    var _intro = [
        "\"" + _q + "\"",
        "Eh, halo! Maaf, aku suka bergumam sendiri, hehe. Aku Adhila, alumni BINUS jurusan Computer Science - Software Engineering.",
        "Aku lagi bantu kegiatan promosi kampus di sini. Ada yang mau kamu obrolin?"
    ];
    dialog_show("Adhila", _intro, scr_adhila_menu());
}