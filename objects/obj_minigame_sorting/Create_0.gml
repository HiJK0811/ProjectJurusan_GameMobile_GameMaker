display_set_gui_size(camera_get_view_width(view_camera[0]),
                     camera_get_view_height(view_camera[0]));
randomize();
src_dialog_data();
src_menu_database();

if(!audio_is_playing(snd_bgm_cafe))
{
    audio_play_sound(
        snd_bgm_cafe,
        0,
        true
    );
}
//==================================================
// SAFE INIT
//==================================================
npc_arrive_sound_played = false;
opening_dialog_started = false;
outro_dialog_started = false;
customer_log = [];
show_npc = false;
npc_arrived = false;
customer_generated = false;
combo_dialog_shown = false;
combo_dialog_started=false;
old_npc_gender = "";
old_npc_variant = -1;
old_npc_color = c_white;
old_requirement = "";
correct_streak = 0;
combo_done = false;

current_walk1 = noone;
current_idle = noone;
current_portrait = noone;

//====================
// NPC SPRITE
//====================

npc_scale = 17;

npc_speed = 2.5;
npc_walk_speed = 8.5;

npc_start_x = 720;
npc_target_x = 150;

npc_start_y = 165;
npc_target_y = 165;

npc_x = npc_start_x;
npc_y = npc_start_y;

npc_walk_frame = 0;
npc_walk_timer = 0;

npc_gender = "";
npc_variant = 0;


//npc_facing = 1; // 1 = kanan

/*npc_direction = "ENTER";

npc_frame = 0;
npc_anim_speed = 0.18;*/

male_walk =
[
    spr_Male_npc1_walk,
    spr_Male_npc2_walk,
    spr_Male_npc3_walk,
    spr_Male_npc4_walk,
    spr_Male_npc5_walk
];

male_idle =
[
    spr_Male_npc1_walk_stay,
    spr_Male_npc2_walk_stay,
    spr_Male_npc3_walk_stay,
    spr_Male_npc4_walk_stay,
    spr_Male_npc5_walk_stay
];

male_portrait =
[
    spr_Male_npc1_portrait,
    spr_Male_npc2_portrait,
    spr_Male_npc3_portrait,
    spr_Male_npc4_portrait,
    spr_Male_npc5_portrait
];
female_walk =
[
    spr_Female_npc1_walk,
    spr_Female_npc2_walk,
    spr_Female_npc3_walk,
    spr_Female_npc4_walk,
    spr_Female_npc5_walk
];

female_idle =
[
    spr_Female_npc1_walk_stay,
    spr_Female_npc2_walk_stay,
    spr_Female_npc3_walk_stay,
    spr_Female_npc4_walk_stay,
    spr_Female_npc5_walk_stay
];

female_portrait =
[
    spr_Female_npc1_portrait,
    spr_Female_npc2_portrait,
    spr_Female_npc3_portrait,
    spr_Female_npc4_portrait,
    spr_Female_npc5_portrait
];

portrait_scale = 5.7;
current_walk1 = male_walk[0];
current_idle = male_idle[0];
current_stay = male_portrait[0];
current_portrait = male_portrait[0];

enum ORDER_STATE
{
	OPENING,
    ARRIVAL,
    REQUEST_DIALOG,
    MINIGAME,
	COMBO,
    RESULT,
    REACTION,
    LEAVE,
	STAGE_RESULT,
	OUTRO,
    STAGE_COMPLETE
}
male_names =
[
    "Aiden","Kai","Riku","Noah","Ren",
    "Hiro","Ethan","Luca","Zane","Felix",
    "Leo","Asher","Dante","Milo","Liam"
];

female_names =
[
    "Rena","Nova","Luna","Hana","Sora",
    "Yuna","Aria","Ayla","Aoi","Mika",
    "Ruby","Kira","Nina","Celine","Maya"
];

npc_colors =
[
    c_white,
    c_red,
    c_blue,
    c_green,
    c_yellow,
    c_orange,
    c_lime,
    c_aqua,
    c_teal,
    c_fuchsia,
    c_purple,
    c_maroon,
    c_navy,
    c_olive,
    c_silver,
    make_color_rgb(255,170,0),
    make_color_rgb(255,120,180),
    make_color_rgb(120,220,255),
    make_color_rgb(180,255,120),
    make_color_rgb(255,210,120)
];
/*menu_data =
[
    "Kopi|18|Pahit|Minuman",
    "Mie Goreng|20|Gurih|Makanan",
    "Es Krim|25|Manis|Cemilan",
    "Kentang Goreng|10|Gurih|Cemilan",
    "Air Putih|5|Tawar|Minuman"
];
*/
req_text = "";
dialog_req="";

// BARU


// =====================================================
// MENU DATA
// =====================================================



// =====================================================
// NPC DATA
// =====================================================



// MENU DATA




// randomize menu
/*for(var i=0;i<50;i++)
{
    var a = irandom(array_length(menu_data)-1);
    var b = irandom(array_length(menu_data)-1);

    var temp = menu_data[a];
    menu_data[a] = menu_data[b];
    menu_data[b] = temp;
}
*/

// =====================================================
// REQUEST
// =====================================================

/*requirement =
choose(
    "MINUMAN_TERMURAH",
    "MINUMAN_TERMAHAL",
    "CEMILAN_TERMURAH",
    "CEMILAN_TERMAHAL",
    "MAKANAN_TERMURAH",
    "MAKANAN_TERMAHAL"
);*/




// =====================================================
// GAME STATE
// =====================================================

state = ORDER_STATE.OPENING;
src_generate_customer();
src_shuffle_menu();

current_customer = 0;
total_customer = 5;

correct_count = 0;
wrong_count = 0;
timeout_count = 0;

success = false;

// =====================================================
// TIMER
// =====================================================

time_limit = 30;

time_left =
    time_limit *
    room_speed;

time_up = false;

// =====================================================
// RESULT
// =====================================================

search_result = "";
result_message = "";

correct_answer = "";

used_winrate = false;

// =====================================================
// DRAG SYSTEM
// =====================================================

selected_index = -1;

drag_index = -1;
hover_index = -1;
drag_start_x = 0;
drag_start_y = 0;

click_candidate = false;

is_dragging = false;

// =====================================================
// REACTION
// =====================================================

npc_reaction = "";

happy_quotes =
[
    "Pesananku sesuai!",
    "Mantap, pelayananmu cepat.",
    "Terima kasih, aku puas.",
    "Kamu benar-benar teliti.",
    "Pesanan tepat sekali.",
    "Aku pasti kembali lagi.",
    "Kerja bagus!",
    "Ini yang aku cari."
];

sad_quotes =
[
    "Sepertinya pesananku salah.",
    "Bukan ini yang aku inginkan.",
    "Hmm... kurang tepat.",
    "Lain kali lebih teliti ya.",
    "Aku agak kecewa.",
    "Pesanannya tidak sesuai.",
    "Sayang sekali.",
    "Coba lebih fokus lain kali."
];


// =====================================================
// MENU PANEL
// =====================================================

menu_panel_x = 880;
menu_panel_y = 50;

menu_panel_w = 420;
menu_panel_h = 620;

// =====================================================
// MENU LIST
// =====================================================

menu_start_x = 900;
menu_start_y = 190;

menu_width = 350;
menu_slot_h = 50;
menu_header_y = menu_start_y - 45;
menu_line_y = menu_start_y - 15;
// =====================================================
// BUTTONS
// =====================================================

btn_search_x = 920;
btn_search_y = 540;

btn_search_w = 100;
btn_search_h = 40;

btn_winrate_x = 1050;
btn_winrate_y = 540;

btn_winrate_w = 100;
btn_winrate_h = 40;

btn_submit_x = 1185;
btn_submit_y = 540;

btn_submit_w = 100;
btn_submit_h = 40;
//button back to main (karena masih early akses)

btn_backmain_x = 450;
btn_backmain_y = 540;

btn_backmain_w = 120;
btn_backmain_h = 50;

// =====================================================
// VALIDATION
// =====================================================

is_sorted_correctly = false;
can_search = false;

// =====================================================
// HIGHLIGHT
// =====================================================

drag_highlight_color = c_lime;
hover_highlight_color = c_yellow;

// =====================================================
// STAGE RESULT
// =====================================================

final_accuracy = 0;
final_rank = "";

// =====================================================
// DIALOG
// =====================================================

dialog_text = "";
result_comment = "";

// =====================================================
// SAFE INIT
// =====================================================

if(variable_instance_exists(id,"npc_reaction") == false)
{
    npc_reaction = "";
}
can_submit =
(search_result != "");
hover_menu = -1;

hover_search = false;
hover_winrate = false;
hover_submit = false;

can_submit = false;
scroll_offset = 0;
npc_exit_x = -320;
visible_rows = 8;
has_player_sorted = false;
show_menu = false;