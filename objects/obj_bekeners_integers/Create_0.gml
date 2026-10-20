// ---------- obj_bekeners_variable : CREATE ----------
event_inherited();
bek_index    = 2;
sprite_index = spr_Bekeners_2;      
depth = -bbox_bottom;
if (variable_global_exists("bekeners_collected") && bek_index < array_length(global.bekeners_collected) && global.bekeners_collected[bek_index]) {
    found = true;
    visible = false;
}