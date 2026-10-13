// 🔥 Kurangi cooldown interaksi setiap frame jika ada
if (variable_global_exists("interact_cooldown") && global.interact_cooldown > 0) {
    global.interact_cooldown--;
}

// Jika jurnal sedang terbuka, abaikan input dialog/interaksi sama sekali
if (variable_global_exists("journal_open") && global.journal_open) {
    exit; 
}

// BLOCK INTERACTIONS DURING CUTSCENES
if (instance_exists(obj_cutscene)) {
    can_interact = false;
    exit; 
}

// Cek apakah cooldown sedang aktif
var _can_trigger = (!variable_global_exists("interact_cooldown") || global.interact_cooldown <= 0);

if (_can_trigger && instance_exists(obj_Player) && distance_to_object(obj_Player) < min_distance_to_player){
    can_interact = true;
    x_spd = 0;
    y_spd = 0;

    if((keyboard_check_pressed(input_key) || keyboard_check_pressed(input_alt)) && !instance_exists(obj_dialogBox) && !instance_exists(obj_dialog)){
        
        // 1. Cek Tower of Hanoi
        if (global.hanoi_completed == true && post_hanoi_text_id != "") {
            create_textbox(post_hanoi_text_id); 
        }   
        // 2. Cek Logic Gate Minigame
        else if (global.logic_gate_completed == true && post_logic_text_id != "") {
            create_textbox(post_logic_text_id); 
        }  
        // 3. Cek Cutscene Kedua
        else if (post_cutscene_check_2 != "" && variable_struct_exists(global.played_cutscenes, post_cutscene_check_2) && post_logic_text_id_2 != "") {
            create_textbox(post_cutscene_text_id_2);
        }
        
        // 4. KHUSUS ADHILA: Langsung buka menu obrolan instan beserta easter egg
        else if (object_index == asset_get_index("obj_Adhila") || object_index == asset_get_index("obj_NPC_Adhila")) {
            dialog_show(
                "Adhila", 
                ["Ada yang bisa kubantu, " + global.player_name + "? Mau ngobrol soal apa nih?"], 
                scr_adhila_menu()
            );
        }
        
        // 5. Cek Cutscene Pertama (NPC Lain)
        else if (post_cutscene_check != "" && variable_struct_exists(global.played_cutscenes, post_cutscene_check) && post_cutscene_text_id != "") {
            create_textbox(post_cutscene_text_id);
        }
        
        // 6. Default untuk NPC Lain
        else {
            create_textbox(text_id); 
        }
    }
} else {
    can_interact = false;
    x_spd = input_x * moveSpeed;
    y_spd = input_y * moveSpeed;
}