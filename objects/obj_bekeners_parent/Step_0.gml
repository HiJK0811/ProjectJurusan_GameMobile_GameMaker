//========================= STEP EVENT (parent) =========================
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

