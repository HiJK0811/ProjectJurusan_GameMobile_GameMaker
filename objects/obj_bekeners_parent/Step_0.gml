//========================= STEP EVENT (parent) =========================
if (found || !visible) exit;
if (variable_global_exists("dialog_active") && global.dialog_active) exit;
if (!variable_global_exists("egg_started") || !global.egg_started) { visible = false; exit; }
if (!instance_exists(asset_get_index("obj_Player"))) exit;

if (point_distance(x, y, obj_Player.x, obj_Player.y) <= interact_range
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

