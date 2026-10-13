// Cek jarak dengan player. Memakai sprite scaled trigger sehingga pakai bbox, bukan radius kecil.
// Skala instance (image_xscale) memperbesar area trigger otomatis.
if (!variable_instance_exists(id, "quest_id")) quest_id = "md_orientasi";
if (!variable_instance_exists(id, "_step_index")) _step_index = 0;

if (instance_exists(obj_Player)) {
    // Cek overlap area trigger (mendukung trigger kotak besar seperti di mainRoom)
    if (place_meeting(x, y, obj_Player) || point_distance(x, y, obj_Player.x, obj_Player.y) <= 64) {
        if (script_exists(update_quest_step_universal)) {
            if (update_quest_step_universal(quest_id, _step_index)) {
                show_debug_message("TRIGGER ACTIVATED: " + string(quest_id) + " step " + string(_step_index));
            }
        }
        instance_destroy();
    }
}
