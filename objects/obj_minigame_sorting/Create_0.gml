src_menu_database();


old_npc_name = "";
old_npc_color = c_white;
old_requirement = "";
customer_log = [];

enum ORDER_STATE
{
    ARRIVAL,
    REQUEST_DIALOG,
    MINIGAME,
    RESULT,
    REACTION,
    LEAVE,
    STAGE_COMPLETE
}
npc_names =
[
    "Rena",
    "Nova",
    "Milo",
    "Dante",
    "Luna"
];

npc_colors =
[
    c_red,
    c_blue,
    c_green,
    c_yellow,
    c_purple
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
src_generate_customer();
src_shuffle_menu();
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

req_text = "";
dialog_req="";


// =====================================================
// GAME STATE
// =====================================================

state = ORDER_STATE.ARRIVAL;

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
// NPC POSITION
// =====================================================

npc_panel_x = 20;
npc_panel_y = 80;

npc_panel_w = 220;
npc_panel_h = 320;

npc_x =
    npc_panel_x + 50;

npc_y =
    npc_panel_y + 50;
	npc_target_x = 80;
npc_speed = 4;

npc_x = -200;
npc_y = 120;
npc_arrived = false;
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

visible_rows = 8;
has_player_sorted = false;
