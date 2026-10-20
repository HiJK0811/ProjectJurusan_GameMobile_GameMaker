// ================= MOUSE =================
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var click = mouse_check_button_pressed(mb_left);

// ================= INIT =================
if(!variable_instance_exists(id, "click_cooldown")){
    click_cooldown = 0;
}

if(click_cooldown > 0){
    click_cooldown--;
}

// ================= SIDEBAR =================
if(mx <= trigger_w){
    sidebar_open = true;
} else if(mx > sidebar_w + 50){
    sidebar_open = false;
}

// animasi
if(sidebar_open){
    sidebar_x = lerp(sidebar_x, 0, sidebar_lerp_speed);
}else{
    sidebar_x = lerp(sidebar_x, -sidebar_w, sidebar_lerp_speed);
}

// ================= VALIDATOR =================
function is_valid_user(d){
    return (
        d.name != "" &&
        d.age != "" &&
        real(d.age) > 0 &&
        string_pos("@", d.email) > 0 &&
        string_length(d.phone) >= 10 &&
        d.gender != "" &&
        d.edu != "" &&
        d.major != ""
    );
}

// ================= CLICK =================
if(click && click_cooldown <= 0 && sidebar_x > -sidebar_w + 10){

    click_cooldown = 6;

    for(var i=0;i<array_length(menu_list);i++){

        var y1 = 100 + i * 40;
        var y2 = y1 + 30;

        if(point_in_rectangle(mx,my, sidebar_x, y1, sidebar_x+sidebar_w, y2)){

            switch(i){

                // ================= CASE 0: INJECT DUMMY & KIRIM KE SUPABASE =================
                case 0:
                    var dummy = {
                        name   : "User_" + string(irandom(9999)),
                        age    : string(irandom_range(18,30)),
                        email  : "user" + string(irandom(9999)) + "@mail.com",
                        phone  : "08" + string(irandom_range(100000000,999999999)),
                        gender : choose("Laki-laki", "Perempuan"),
                        edu    : choose("SMA","SMK"),
                        major  : ""
                    };

                    dummy.major = (dummy.edu == "SMA")
                        ? choose("IPA","IPS","Bahasa")
                        : choose("RPL","TKJ","DKV");

                    // Inject ke form lokal jika ada
                    if(instance_exists(obj_input_player_data)){
                        with(obj_input_player_data){
                            input_name     = dummy.name;
                            input_age      = dummy.age;
                            input_email    = dummy.email;
                            input_phone    = dummy.phone;
                            // Jika objek form kamu menyimpan gender, sesuaikan variabelnya di sini
                            selected_gender= dummy.gender; 
                            selected_edu   = dummy.edu;
                            selected_major = dummy.major;
                        }
                    }

                    // KIRIM LANGSUNG KE SUPABASE (7 Parameter: Name, Age, Email, Phone, Gender, Edu, Major)
                    scr_send_to_supabase(dummy.name, dummy.age, dummy.email, dummy.phone, dummy.gender, dummy.edu, dummy.major);
                    
                    show_debug_message("[SUPABASE] Inject & Sent: " + dummy.name);
                break;


                // ================= CASE 1: SUBMIT FORM KE SUPABASE =================
                case 1:
                    if(instance_exists(obj_input_player_data)){
                        with(obj_input_player_data){
                            var data = {
                                name   : input_name,
                                age    : input_age,
                                email  : input_email,
                                phone  : input_phone,
                                gender : global.form.gender, // Ambil dari global form atau variabel lokal form
                                edu    : selected_edu,
                                major  : selected_major
                            };

                            if(is_valid_user(data)){
                                // KIRIM KE SUPABASE
                                other.scr_send_to_supabase(data.name, data.age, data.email, data.phone, data.gender, data.edu, data.major);
                                show_debug_message("[SUPABASE] SUBMIT Sent: " + data.name);
                            }else{
                                show_debug_message("[ERROR] INVALID DATA - Gagal kirim");
                            }
                        }
                    }
                break;


                // ================= CASE 2: AUTO 50 DATA KE SUPABASE =================
                case 2:
                    repeat(50){
                        var edu = choose("SMA","SMK");
                        var d_name   = "Auto_" + string(irandom(99999));
                        var d_age    = string(irandom_range(18,30));
                        var d_email  = "auto" + string(irandom(99999)) + "@mail.com";
                        var d_phone  = "08" + string(irandom_range(100000000,999999999));
                        var d_gender = choose("Laki-laki", "Perempuan");
                        var d_edu    = edu;
                        var d_major  = (edu == "SMA") ? choose("IPA","IPS","Bahasa") : choose("RPL","TKJ","DKV");

                        scr_send_to_supabase(d_name, d_age, d_email, d_phone, d_gender, d_edu, d_major);
                    }
                    show_debug_message("[SUPABASE] AUTO 50 Data Dispatched!");
                break;


                // ================= CASE 3: EXPORT JSON DIALOG =================
                case 3:
                    scr_export_json_dialog();
                break;


                // ================= CASE 4: CLEAR LOKAL =================
                case 4:
                    global.user_data = [];
                    show_debug_message("[DEBUG] LOCAL DATA CLEARED");
                break;


                // ================= CASE 5: STRESS TEST (200 DATA) =================
                case 5:
                    repeat(200){ // 200 data sesuai permintaan
                        var s_name   = "Stress_" + string(irandom(999999));
                        var s_age    = string(irandom_range(10,60));
                        var s_email  = "stress@mail.com";
                        var s_phone  = "08" + string(irandom_range(100000000,999999999));
                        var s_gender = choose("Laki-laki", "Perempuan");
                        var s_edu    = choose("SMA","SMK");
                        var s_major  = choose("IPA","IPS","RPL","TKJ","DKV");

                        scr_send_to_supabase(s_name, s_age, s_email, s_phone, s_gender, s_edu, s_major);
                    }
                    show_debug_message("[SUPABASE] STRESS TEST 200 Data Sent!");
                break;


                // ================= CASE 6: ARCHIVE =================
                case 6:
                    show_debug_message("OPEN ARCHIVE");
                    if(!instance_exists(obj_archive)){
                        instance_create_layer(0, 0, "Instances", obj_archive);
                    }
                break;


                // ================= CASE 7: MINIGAME =================
                case 7:
                    room_goto(room_minigame_sorting);
                break;


                // ================= CASE 8: COPY EXPORT PATH =================
                case 8:
                    clipboard_set_text(global.export_path);
                    show_debug_message("[DEBUG] Path disalin: " + global.export_path);
                break;


                // ================= CASE 9: BACK TO INPUT =================
                case 9:
                    audio_play_sound(snd_confirm, 1, false);
                    room_goto(room_input_data);
                break;

            }
        }
    }
}