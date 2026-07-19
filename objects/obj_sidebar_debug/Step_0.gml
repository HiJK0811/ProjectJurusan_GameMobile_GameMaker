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

                // ================= INJECT =================
                case 0:

                    var dummy = {
                        name  : "User_" + string(irandom(9999)),
                        age   : string(irandom_range(18,30)),
                        email : "user" + string(irandom(9999)) + "@mail.com",
                        phone : "08" + string(irandom_range(100000000,999999999)),
                        edu   : choose("SMA","SMK"),
                        major : ""
                    };

                    dummy.major = (dummy.edu == "SMA")
                        ? choose("IPA","IPS","Bahasa")
                        : choose("RPL","TKJ","DKV");

                    // inject ke form kalau ada
                    if(instance_exists(obj_input_player_data)){
                        with(obj_input_player_data){
                            input_name  = dummy.name;
                            input_age   = dummy.age;
                            input_email = dummy.email;
                            input_phone = dummy.phone;
                            selected_edu   = dummy.edu;
                            selected_major = dummy.major;
                        }

                        show_debug_message("[DEBUG] Inject FORM:");
                    }
                    else{
                        array_push(global.user_data, dummy);
                        show_debug_message("[WARNING] FORM TIDAK ADA → langsung save");
                    }

                    show_debug_message("Name: " + dummy.name);
                    show_debug_message("Age: " + dummy.age);
                    show_debug_message("Email: " + dummy.email);
                    show_debug_message("Phone: " + dummy.phone);
                    show_debug_message("Edu: " + dummy.edu + " | " + dummy.major);

                break;


                // ================= SUBMIT =================
                case 1:

                    if(instance_exists(obj_input_player_data)){

                        with(obj_input_player_data){

                            var data = {
                                name: input_name,
                                age: input_age,
                                email: input_email,
                                phone: input_phone,
                                edu: selected_edu,
                                major: selected_major
                            };

                            if(is_valid_user(data)){
                                array_push(global.user_data, data);
                                show_debug_message("[DEBUG] SUBMIT: " + data.name);
                            }else{
                                show_debug_message("[ERROR] INVALID DATA");
                            }
                        }
                    }

                break;


                // ================= AUTO 50 =================
                case 2:

                    repeat(50){
                        var edu = choose("SMA","SMK");

                        var d = {
                            name:"User_"+string(irandom(99999)),
                            age:string(irandom_range(18,30)),
                            email:"auto"+string(irandom(99999))+"@mail.com",
                            phone:"08"+string(irandom_range(100000000,999999999)),
                            edu:edu,
                            major:(edu=="SMA")
                                ? choose("IPA","IPS","Bahasa")
                                : choose("RPL","TKJ","DKV")
                        };

                        array_push(global.user_data, d);
                    }

                    show_debug_message("[DEBUG] AUTO 50 DONE");

                break;


                // ================= EXPORT JSON =================
               // ================= EXPORT CSV -> ganti jadi Export Json dialog =================
case 3:
    scr_export_json_dialog();
break;




                // ================= CLEAR =================
                case 4:
                    global.user_data = [];
                    show_debug_message("[DEBUG] DATA CLEARED");
                break;


                // ================= STRESS =================
                case 5:

                    repeat(200){
                        array_push(global.user_data,{
                            name:"Stress_"+string(irandom(999999)),
                            age:string(irandom_range(10,60)),
                            email:"stress@mail.com",
                            phone:"08"+string(irandom_range(100000000,999999999)),
                            edu:choose("SMA","SMK"),
                            major:choose("IPA","IPS","RPL","TKJ","DKV")
                        });
                    }

                    show_debug_message("[DEBUG] STRESS DONE");

                break;
				//Archive
				case 6:

show_debug_message("OPEN ARCHIVE");

if(!instance_exists(obj_archive))
{
    var inst =
    instance_create_layer(
    0,
    0,
    "Instances",
    obj_archive
);

    show_debug_message(
        "ID = " + string(inst)
    );
}

break;
			
				//Minigame:Sorting early access
				case 7:
				minigame=room_goto(room_minigame_sorting);
				break
				// ================= OPEN EXPORT FOLDER =================
// ================= COPY EXPORT PATH KE CLIPBOARD =================
case 8:
    clipboard_set_text(global.export_path);
    show_debug_message("[DEBUG] Path disalin ke clipboard: " + global.export_path);
break;
case 9:
audio_play_sound(snd_confirm, 1, false);
    room_goto(room_input_data)
break;
            }
        }
    }
}